import 'package:video_player/video_player.dart';
import 'package:stacked/stacked.dart';
import 'package:kratos_iq/services/api_service.dart';
import 'package:kratos_iq/app/app.locator.dart';

class AssetPlayerViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();

  VideoPlayerController? videoController;
  bool _isReady = false;
  bool _hasError = false;

  bool get isPlayerReady => _isReady;
  bool get hasError => _hasError;

  Future<void> init() async {
    setBusy(true);
    _hasError = false;
    _isReady = false;
    notifyListeners();

    try {
      final urlString = await _apiService
          .getLectureVideoUrl('b2f16197-e327-4f9b-b625-349cc979169e');

      videoController = VideoPlayerController.networkUrl(
        Uri.parse(urlString),
      );
      await videoController!.initialize();
      videoController!
        ..setLooping(true)
        ..play();

      _isReady = true;
    } catch (_) {
      _hasError = true;
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void togglePlayPause() {
    if (!isPlayerReady) return;
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
    notifyListeners();
  }

  void skipForward() {
    if (!isPlayerReady) return;
    final pos = videoController!.value.position;
    videoController!.seekTo(pos + const Duration(seconds: 10));
  }

  void skipBackward() {
    if (!isPlayerReady) return;
    final pos = videoController!.value.position;
    videoController!.seekTo(pos - const Duration(seconds: 10));
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }
}
