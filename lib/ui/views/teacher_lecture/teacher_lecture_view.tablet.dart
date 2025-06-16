import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'teacher_lecture_viewmodel.dart';

class TeacherDashboardViewTablet
    extends ViewModelWidget<TeacherDashboardViewModel> {
  const TeacherDashboardViewTablet({super.key});

  @override
  Widget build(BuildContext context, TeacherDashboardViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - TeacherLectureView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
