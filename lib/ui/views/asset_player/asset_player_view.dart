import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'asset_player_view.desktop.dart';
import 'asset_player_view.tablet.dart';
import 'asset_player_view.mobile.dart';
import 'asset_player_viewmodel.dart';

class AssetPlayerView extends StackedView<AssetPlayerViewModel> {
  const AssetPlayerView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AssetPlayerViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AssetPlayerViewMobile(),
      tablet: (_) => const AssetPlayerViewTablet(),
      desktop: (_) => const AssetPlayerViewDesktop(),
    );
  }

  @override
  AssetPlayerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AssetPlayerViewModel();
}
