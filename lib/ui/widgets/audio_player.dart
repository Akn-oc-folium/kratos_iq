import 'package:flutter/material.dart' as material;
import 'package:just_audio/just_audio.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AudioPlayerWithTranscript extends StatefulWidget {
  final String audioUrl;
  final String transcript;

  const AudioPlayerWithTranscript({
    super.key,
    required this.audioUrl,
    required this.transcript,
  });

  @override
  State<AudioPlayerWithTranscript> createState() =>
      _AudioPlayerWithTranscriptState();
}

class _AudioPlayerWithTranscriptState extends State<AudioPlayerWithTranscript> {
  late AudioPlayer _audioPlayer;
  Duration _totalDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    await _audioPlayer.setUrl(widget.audioUrl);
    _totalDuration = await _audioPlayer.load() ?? Duration.zero;
    _audioPlayer.positionStream.listen((pos) {
      setState(() => _currentPosition = pos);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  void _skipForward() {
    final newPos = _currentPosition + const Duration(seconds: 10);
    _audioPlayer.seek(newPos);
  }

  void _skipBackward() {
    final newPos = _currentPosition - const Duration(seconds: 10);
    _audioPlayer.seek(newPos < Duration.zero ? Duration.zero : newPos);
  }

  void _downloadAudio() {
    debugPrint("Download requested for ${widget.audioUrl}");
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes);
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 487,
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: kcWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(widget.transcript).small.medium(
                    color: kcSlate700,
                    height: 1.714,
                  ),
            ),
          ),
        ),
        vertical08,
        Container(
          width: 487,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: kcGray100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: material.Column(
            children: [
              material.SliderTheme(
                data: material.SliderTheme.of(context).copyWith(
                  padding: const EdgeInsets.all(0),
                  activeTrackColor: kcLime500,
                  inactiveTrackColor: kcGray200,
                  thumbColor: kcLime500,
                  overlayColor: kcLime600,
                  trackHeight: 2.0,
                  thumbSize: WidgetStateProperty.all(const Size(8, 8)),
                  overlayShape: const material.RoundSliderOverlayShape(
                    overlayRadius: 12.0,
                  ),
                  thumbShape: const material.RoundSliderThumbShape(
                    enabledThumbRadius: 8.0,
                  ),
                ),
                child: material.Slider(
                  value: _currentPosition.inSeconds.toDouble(),
                  max: _totalDuration.inSeconds.toDouble(),
                  onChanged: (value) =>
                      _audioPlayer.seek(Duration(seconds: value.toInt())),
                ),
              ),
              vertical08,
              vertical04,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_formatDuration(_currentPosition)} / ${_formatDuration(_totalDuration)}",
                  ).small.normal(color: kcGray400, height: 1.714),
                  Row(
                    children: [
                      material.IconButton(
                        iconSize: 16,
                        onPressed: _skipBackward,
                        icon: const Icon(Icons.fast_rewind_outlined),
                      ),
                      horizontal04,
                      material.IconButton.filled(
                        iconSize: 40,
                        onPressed: _togglePlayPause,
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                          size: 16,
                          color: kcBlack,
                        ),
                        color: kcLime300,
                      ),
                      horizontal04,
                      material.IconButton(
                        onPressed: _skipForward,
                        icon: const Icon(Icons.fast_forward_outlined),
                      ),
                    ],
                  ),
                  material.IconButton(
                    onPressed: _downloadAudio,
                    icon: const Icon(Icons.download),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
