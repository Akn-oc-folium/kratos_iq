import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'video_feed_viewmodel.dart';

class VideoFeedViewTablet extends ViewModelWidget<VideoFeedViewModel> {
  const VideoFeedViewTablet({super.key});

  @override
  Widget build(BuildContext context, VideoFeedViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - VideoFeedView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
