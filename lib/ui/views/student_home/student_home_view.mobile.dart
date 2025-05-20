import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'student_home_viewmodel.dart';

class StudentHomeViewMobile extends ViewModelWidget<StudentHomeViewModel> {
  const StudentHomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, StudentHomeViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - StudentHomeView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
