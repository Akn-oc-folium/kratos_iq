import 'package:flutter/material.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutViewDesktop extends ViewModelWidget<MainLayoutViewModel> {
  final Widget body;
  const MainLayoutViewDesktop({super.key, required this.body});

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset(
        Assets.images.logo.path,
        width: 102,
        height: 24,
        fit: BoxFit.contain,
      )),
      body: body,
    );
  }
}
