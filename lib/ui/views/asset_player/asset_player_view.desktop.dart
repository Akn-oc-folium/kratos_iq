import 'package:flutter/material.dart' as material;
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
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
          videoArea = Center(
            child: material.CircularProgressIndicator(
              color: kcGreen700,
              strokeWidth: 3,
              semanticsLabel: 'Loading video',
              semanticsValue: 'Loading video player',
              value: null,
            ),
          );
        } else if (vm.hasError) {
          videoArea = Container(
            color: const Color(0xFFD9D9D9),
            child: Center(
              child: const Text(
                'Video not working',
              ).base(color: kcZinc900),
            ),
          );
        } else if (vm.isPlayerReady && vm.videoController != null) {
          videoArea = AspectRatio(
            aspectRatio: vm.videoController!.value.aspectRatio,
            child: VideoPlayer(vm.videoController!),
          );
        } else {
          videoArea = Container(
            color: const Color(0xFFD9D9D9),
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
                      const Text('KratosIQ Live Video Feed').h3(
                        color: kcBlack,
                        letterSpacing: -0.6,
                        height: 1.33,
                      ),
                      vertical16,
                      Container(
                        height: 460,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
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
                          width: 818,
                          decoration: BoxDecoration(
                            color: kcGray100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              VideoProgressIndicator(
                                vm.videoController!,
                                allowScrubbing: true,
                                padding: EdgeInsets.zero,
                                colors: VideoProgressColors(
                                  playedColor: kcLime500,
                                  bufferedColor: kcZinc300,
                                  backgroundColor: kcGray200,
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
                                  ).small.normal(color: kcGray400),
                                  Row(
                                    children: [
                                      IconButton(
                                        variance: ButtonVariance.text,
                                        onPressed: vm.skipBackward,
                                        icon: const Icon(Icons.fast_rewind),
                                      ),
                                      GestureDetector(
                                        onTap: vm.togglePlayPause,
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kcLime300,
                                          ),
                                          child: Icon(
                                            vm.videoController!.value.isPlaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            size: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        variance: ButtonVariance.text,
                                        onPressed: vm.skipForward,
                                        icon: const Icon(Icons.fast_forward),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: kcLime300,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text('Live').small.semiBold(
                                          color: kcZinc900,
                                          height: 1.428,
                                        ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 112),
                SizedBox(
                  width: 382,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Measurable').xLarge.h4(
                            color: kcBlack,
                            letterSpacing: -0.5,
                            height: 1.4,
                          ),
                      vertical08,
                      vertical04,
                      Image.asset(
                        Assets.images.measurableColumn.path,
                        height: 690,
                      )
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
