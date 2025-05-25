import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'video_feed_view.desktop.dart';
import 'video_feed_view.tablet.dart';
import 'video_feed_view.mobile.dart';
import 'video_feed_viewmodel.dart';

class VideoFeedView extends StackedView<VideoFeedViewModel> {
  const VideoFeedView({super.key});

  @override
  Widget builder(
    BuildContext context,
    VideoFeedViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const VideoFeedViewMobile(),
      tablet: (_) => const VideoFeedViewTablet(),
      desktop: (_) => const VideoFeedViewDesktop(),
    );
  }

  @override
  VideoFeedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VideoFeedViewModel();
}
