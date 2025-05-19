import 'package:flutter/material.dart';
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/flashcard/flashcard_view.dart';
import 'package:kratos_iq/ui/views/quiz/quiz_view.dart';
import 'package:kratos_iq/ui/widgets/flash_card.dart';
import 'package:kratos_iq/ui/widgets/quiz_card.dart';
import 'package:kratos_iq/ui/widgets/quiz_deck.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset(
        Assets.images.logo.path,
        width: 102,
        height: 24,
        fit: BoxFit.contain,
      )),
      body: const FlashcardView(
        lectureNumber: 1,
      ),
    );
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
