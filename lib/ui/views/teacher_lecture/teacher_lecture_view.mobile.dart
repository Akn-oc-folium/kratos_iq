import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'teacher_lecture_viewmodel.dart';

class TeacherLectureViewMobile
    extends ViewModelWidget<TeacherLectureViewModel> {
  const TeacherLectureViewMobile({super.key});

  @override
  Widget build(BuildContext context, TeacherLectureViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - TeacherLectureView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
