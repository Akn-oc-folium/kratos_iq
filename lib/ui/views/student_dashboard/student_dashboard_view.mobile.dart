import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'student_dashboard_viewmodel.dart';

class StudentDashboardViewMobile
    extends ViewModelWidget<StudentDashboardViewModel> {
  const StudentDashboardViewMobile({super.key});

  @override
  Widget build(BuildContext context, StudentDashboardViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - StudentDashboardView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
