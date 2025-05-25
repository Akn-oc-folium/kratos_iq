import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'video_feed_viewmodel.dart';

class VideoFeedViewDesktop extends ViewModelWidget<VideoFeedViewModel> {
  const VideoFeedViewDesktop({super.key});

  @override
  Widget build(BuildContext context, VideoFeedViewModel viewModel) {
    return ViewModelBuilder<VideoFeedViewModel>.reactive(
      viewModelBuilder: () => VideoFeedViewModel(),
      builder: (context, viewModel, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  vertical16,
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          value: 0.4,
                          backgroundColor: Colors.grey.shade300,
                          color: kcLimeC16,
                        ),
                        vertical08,
                        vertical04,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '21:05 / 51:30',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.fast_rewind),
                                ),
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kcLime264,
                                  ),
                                  child: const Icon(Icons.play_arrow, size: 20),
                                ),
                                IconButton(
                                  onPressed: () {},
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
                  )
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  vertical16,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
