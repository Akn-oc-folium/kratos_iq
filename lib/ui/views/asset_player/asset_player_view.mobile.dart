import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'asset_player_viewmodel.dart';

class AssetPlayerViewMobile extends ViewModelWidget<AssetPlayerViewModel> {
  const AssetPlayerViewMobile({super.key});

  @override
  Widget build(BuildContext context, AssetPlayerViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - AssetPlayerView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
