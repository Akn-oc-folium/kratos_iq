import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'teacher_home_viewmodel.dart';

class TeacherHomeViewTablet extends ViewModelWidget<TeacherHomeViewModel> {
  const TeacherHomeViewTablet({super.key});

  @override
  Widget build(BuildContext context, TeacherHomeViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - TeacherHomeView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
