import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'teacher_lecture_view.desktop.dart';
import 'teacher_lecture_view.tablet.dart';
import 'teacher_lecture_view.mobile.dart';
import 'teacher_lecture_viewmodel.dart';

class TeacherLectureView extends StackedView<TeacherLectureViewModel> {
  final int lectureNumber;
  const TeacherLectureView({super.key, required this.lectureNumber});

  @override
  Widget builder(
    BuildContext context,
    TeacherLectureViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TeacherLectureViewMobile(),
      tablet: (_) => const TeacherLectureViewTablet(),
      desktop: (_) => TeacherLectureViewDesktop(lectureNumber: lectureNumber),
    );
  }

  @override
  TeacherLectureViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherLectureViewModel(lectureNumber);
}
