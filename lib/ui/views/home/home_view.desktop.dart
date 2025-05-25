import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/views/student_home/student_home_view.dart';
import 'package:kratos_iq/ui/views/teacher_home/teacher_home_view.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, _) {
        return MainLayoutView(
          body: viewModel.isStudent
              ? const StudentHomeView()
              : const TeacherHomeView(),
        );
      },
    );
  }
}
