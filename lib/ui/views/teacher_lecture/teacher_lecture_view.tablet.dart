import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'teacher_lecture_viewmodel.dart';

class TeacherLectureViewTablet
    extends ViewModelWidget<TeacherLectureViewModel> {
  const TeacherLectureViewTablet({super.key});

  @override
  Widget build(BuildContext context, TeacherLectureViewModel viewModel) {
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
