import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'video_feed_viewmodel.dart';

class VideoFeedViewMobile extends ViewModelWidget<VideoFeedViewModel> {
  const VideoFeedViewMobile({super.key});

  @override
  Widget build(BuildContext context, VideoFeedViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - VideoFeedView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
