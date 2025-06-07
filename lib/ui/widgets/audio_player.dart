import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class AudioPlayerWithTranscript extends StatefulWidget {
  final String audioUrl;
  final List<Map<String, dynamic>> transcript;

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
    return d.toString().split('.').first.padLeft(8, "0");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 487,
          height: 454,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: kcWhite,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.transcript
                  .map((entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          entry['text'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kcBlack,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        vertical08,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: SizedBox(
            width: 487,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: kcLime500,
                inactiveTrackColor: kcGray200,
                thumbColor: kcLime700,
                overlayColor: kcLime600,
                trackHeight: 4.0,
              ),
              child: Slider(
                value: _currentPosition.inSeconds.toDouble(),
                max: _totalDuration.inSeconds.toDouble(),
                onChanged: (value) =>
                    _audioPlayer.seek(Duration(seconds: value.toInt())),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            width: 487,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_formatDuration(_currentPosition)} / ${_formatDuration(_totalDuration)}",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: _skipBackward,
                      icon: const Icon(Icons.fast_rewind_rounded),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kcLime300,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 16,
                          color: kcBlack,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                    ),
                    IconButton(
                      onPressed: _skipForward,
                      icon: const Icon(Icons.fast_forward_rounded),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: _downloadAudio,
                  icon: const Icon(Icons.download),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
