import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_view.desktop.dart';
import 'main_layout_view.tablet.dart';
import 'main_layout_view.mobile.dart';
import 'main_layout_viewmodel.dart';

class MainLayoutView extends StackedView<MainLayoutViewModel> {
  final Widget body;
  const MainLayoutView({super.key, required this.body});

  @override
  Widget builder(
    BuildContext context,
    MainLayoutViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const MainLayoutViewMobile(),
      tablet: (_) => const MainLayoutViewTablet(),
      desktop: (_) => MainLayoutViewDesktop(
        body: body,
      ),
    );
  }

  @override
  MainLayoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainLayoutViewModel();
}
