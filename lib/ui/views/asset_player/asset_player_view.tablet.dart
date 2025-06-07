import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'asset_player_viewmodel.dart';

class AssetPlayerViewTablet extends ViewModelWidget<AssetPlayerViewModel> {
  const AssetPlayerViewTablet({super.key});

  @override
  Widget build(BuildContext context, AssetPlayerViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - AssetPlayerView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
