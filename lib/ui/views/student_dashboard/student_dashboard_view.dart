import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'student_dashboard_view.desktop.dart';
import 'student_dashboard_view.tablet.dart';
import 'student_dashboard_view.mobile.dart';
import 'student_dashboard_viewmodel.dart';

class StudentDashboardView extends StackedView<StudentDashboardViewModel> {
  final String lectureId;
  const StudentDashboardView({super.key, required this.lectureId});

  @override
  Widget builder(
    BuildContext context,
    StudentDashboardViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const StudentDashboardViewMobile(),
      tablet: (_) => const StudentDashboardViewTablet(),
      desktop: (_) => StudentDashboardViewDesktop(lectureId: lectureId),
    );
  }

  @override
  StudentDashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentDashboardViewModel(lectureId);
}
