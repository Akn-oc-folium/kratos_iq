import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/views/student_dashboard/student_dashboard_view.dart';
import 'package:kratos_iq/ui/views/student_home/student_home_view.dart';
import 'package:kratos_iq/ui/views/teacher_home/teacher_home_view.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const MainLayoutView(body: TeacherHomeView());
  }
}

// const LectureCard(
//   lectureNumber: 'Lecture 1',
//   date: 'Apr 10',
//   cardColor: kcDarkGreenColor,
// ),
// vertical12,
// FlashDeck(
//   assetImage: AssetImage(Assets.images.designFundamentals.path),
//   label: 'Design Fundamentals',
//   content: 'User Personas, Affinity Mapping, MVP',
// ),
// vertical12,
// QuizDeckCard(
//   title: 'Linear Equations',
//   subTitle: '10 Qs',
// ),
// vertical04,
// vertical08,
// QuizCard(
//   questionNumber: '7/13',
//   question:
//       "Which of the following best describes the Second Law of Thermodynamics?",
//   options: [
//     "Energy cannot be created or destroyed, only transformed.",
//     "Energy cannot be created or destroyed, only transformed.",
//     "Energy cannot be created or destroyed, only transformed.",
//     "Energy cannot be created or destroyed, only transformed."
//   ],
//   correctIndex: 2,
// ),
// FlashCard(
//   title: 'Heat Pump / Refrigerator',
//   content: 'Heat Pump',
// ),
