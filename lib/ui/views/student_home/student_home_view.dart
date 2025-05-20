import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'student_home_view.desktop.dart';
import 'student_home_view.tablet.dart';
import 'student_home_view.mobile.dart';
import 'student_home_viewmodel.dart';

class StudentHomeView extends StackedView<StudentHomeViewModel> {
  const StudentHomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StudentHomeViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const StudentHomeViewMobile(),
      tablet: (_) => const StudentHomeViewTablet(),
      desktop: (_) => const StudentHomeViewDesktop(),
    );
  }

  @override
  StudentHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentHomeViewModel();
}
