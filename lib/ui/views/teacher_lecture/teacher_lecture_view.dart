import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'teacher_lecture_view.desktop.dart';
import 'teacher_lecture_view.mobile.dart';
import 'teacher_lecture_view.tablet.dart';
import 'teacher_lecture_viewmodel.dart';

class TeacherDashboardView extends StackedView<TeacherDashboardViewModel> {
  final int lectureNumber;
  final String lectureId;
  const TeacherDashboardView(
      {super.key, required this.lectureNumber, required this.lectureId});

  @override
  Widget builder(
    BuildContext context,
    TeacherDashboardViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TeacherDashboardViewMobile(),
      tablet: (_) => const TeacherDashboardViewTablet(),
      desktop: (_) => TeacherDashboardViewDesktop(
        lectureNumber: lectureNumber,
        lectureId: lectureId,
      ),
    );
  }

  @override
  TeacherDashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherDashboardViewModel(lectureNumber, lectureId);
}
