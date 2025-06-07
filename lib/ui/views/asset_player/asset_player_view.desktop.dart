import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

import 'asset_player_viewmodel.dart';

class AssetPlayerViewDesktop extends StatelessWidget {
  const AssetPlayerViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssetPlayerViewModel>.reactive(
      viewModelBuilder: () => AssetPlayerViewModel(),
      onViewModelReady: (vm) => vm.init(),
      builder: (context, vm, child) {
        Widget videoArea;
        if (vm.isBusy) {
          videoArea = const Center(child: CircularProgressIndicator());
        } else if (vm.hasError) {
          videoArea = Container(
            color: Colors.grey.shade400,
            child: const Center(
              child: Text(
                'Video not working',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        } else if (vm.isPlayerReady && vm.videoController != null) {
          videoArea = AspectRatio(
            aspectRatio: vm.videoController!.value.aspectRatio,
            child: VideoPlayer(vm.videoController!),
          );
        } else {
          videoArea = Container(
            color: Colors.grey.shade300,
          );
        }

        return MainLayoutView(
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'KratosIQ Live Video Feed',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      vertical16,
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: videoArea,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (vm.isPlayerReady && vm.videoController != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              VideoProgressIndicator(
                                vm.videoController!,
                                allowScrubbing: true,
                                padding: EdgeInsets.zero,
                                colors: VideoProgressColors(
                                  playedColor: kcLimeC16,
                                  bufferedColor: Colors.grey.shade400,
                                  backgroundColor: Colors.grey.shade300,
                                ),
                              ),
                              vertical08,
                              vertical04,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${_formatDuration(vm.videoController!.value.position)}'
                                    ' / ${_formatDuration(vm.videoController!.value.duration)}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: vm.skipBackward,
                                        icon: const Icon(Icons.fast_rewind),
                                      ),
                                      GestureDetector(
                                        onTap: vm.togglePlayPause,
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kcLime264,
                                          ),
                                          child: Icon(
                                            vm.videoController!.value.isPlaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: vm.skipForward,
                                        icon: const Icon(Icons.fast_forward),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: kcLime264,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text('Live'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                horizontal32,
                horizontal16,
                const Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Measurable',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      vertical16,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
