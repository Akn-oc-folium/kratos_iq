import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'teacher_home_view.desktop.dart';
import 'teacher_home_view.tablet.dart';
import 'teacher_home_view.mobile.dart';
import 'teacher_home_viewmodel.dart';

class TeacherHomeView extends StackedView<TeacherHomeViewModel> {
  const TeacherHomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TeacherHomeViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TeacherHomeViewMobile(),
      tablet: (_) => const TeacherHomeViewTablet(),
      desktop: (_) => const TeacherHomeViewDesktop(),
    );
  }

  @override
  TeacherHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherHomeViewModel();
}
