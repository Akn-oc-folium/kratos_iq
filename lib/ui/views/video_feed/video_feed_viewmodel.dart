import 'dart:convert';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:stacked/stacked.dart';

class VideoFeedViewModel extends BaseViewModel {
  final RTCVideoRenderer renderer = RTCVideoRenderer();

  RTCPeerConnection? _peerConnection;

  WebSocketChannel? _wsChannel;

  String? _viewerId;

  bool _isStreaming = false;
  bool get isStreaming => _isStreaming;

  Future<void> initRendererAndConnect() async {
    setBusy(true);
    await renderer.initialize();
    _connectToSignalingServer();
    setBusy(false);
  }

  void _connectToSignalingServer() {
    final uri = Uri.parse('wss://api.isomorphiq.com/ws');
    _wsChannel = WebSocketChannel.connect(uri);

    _wsChannel!.sink.add(jsonEncode({
      'type': 'join',
      'role': 'viewer',
    }));

    _wsChannel!.stream.listen(
      (rawMessage) {
        _handleSignalingMessage(rawMessage);
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket closed.');
      },
    );
  }

  Future<void> _handleSignalingMessage(dynamic rawMessage) async {
    final msg = jsonDecode(rawMessage as String) as Map<String, dynamic>;
    final type = msg['type'] as String?;
    final role = msg['role'] as String?;

    if (type == null || role == null) {
      print('Malformed message from WebSocket: $msg');
      return;
    }

    if (role == 'broadcaster') {
      switch (type) {
        case 'offer':
          {
            if (msg.containsKey('viewer_id')) {
              _viewerId = msg['viewer_id'] as String?;
            }
            final sdpOffer = msg['sdp'] as String;
            await _onOfferReceived(sdpOffer);
            break;
          }

        case 'candidate':
          {
            final candidateMap = msg['candidate'] as Map<String, dynamic>;
            await _addRemoteIceCandidate(candidateMap);
            break;
          }

        default:
          print('Unknown broadcaster message type: $msg');
      }
    }
  }

  Future<void> _onOfferReceived(String sdpOffer) async {
    if (_peerConnection != null) {
      await _peerConnection!.close();
      _peerConnection = null;
    }

    final iceServers = [
      {
        'urls': 'stun:stun.l.google.com:19302',
      },
    ];
    final config = <String, dynamic>{
      'iceServers': iceServers,
      'sdpSemantics': 'unified-plan',
    };
    _peerConnection = await createPeerConnection(config, <String, dynamic>{});
    _peerConnection!.onIceCandidate = (RTCIceCandidate candidate) {
      if (candidate.candidate != null && _viewerId != null) {
        final iceMsg = {
          'type': 'candidate',
          'role': 'viewer',
          'candidate': {
            'candidate': candidate.candidate,
            'sdpMid': candidate.sdpMid,
            'sdpMLineIndex': candidate.sdpMLineIndex,
          },
          'viewer_id': _viewerId,
        };
        _wsChannel!.sink.add(jsonEncode(iceMsg));
      }
    };

    final remoteStream = await createLocalMediaStream('remoteStream');
    _peerConnection!.onTrack = (RTCTrackEvent event) {
      if (event.track.kind == 'video') {
        remoteStream.addTrack(event.track);
        renderer.srcObject = remoteStream;

        _isStreaming = true;
        notifyListeners();
      }
    };

    final offerDesc = RTCSessionDescription(sdpOffer, 'offer');
    await _peerConnection!.setRemoteDescription(offerDesc);

    final answerDesc = await _peerConnection!.createAnswer(<String, dynamic>{
      'offerToReceiveAudio': true,
      'offerToReceiveVideo': true,
    });
    await _peerConnection!.setLocalDescription(answerDesc);

    if (_viewerId != null) {
      final answerMsg = {
        'type': 'answer',
        'role': 'viewer',
        'sdp': answerDesc.sdp,
        'viewer_id': _viewerId,
      };
      _wsChannel!.sink.add(jsonEncode(answerMsg));
    }

    notifyListeners();
  }

  Future<void> _addRemoteIceCandidate(Map<String, dynamic> candidateMap) async {
    if (_peerConnection == null) return;

    final candidate = RTCIceCandidate(
      candidateMap['candidate'] as String?,
      candidateMap['sdpMid'] as String?,
      candidateMap['sdpMLineIndex'] as int?,
    );
    await _peerConnection!.addCandidate(candidate);
  }

  Future<void> stopStream() async {
    if (_peerConnection != null) {
      await _peerConnection!.close();
      _peerConnection = null;
    }

    if (renderer.srcObject != null) {
      renderer.srcObject!.getTracks().forEach((track) => track.stop());
    }
    renderer.srcObject = null;

    _isStreaming = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _peerConnection?.close();
    _wsChannel?.sink.close();
    renderer.dispose();
    super.dispose();
  }
}
