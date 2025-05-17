import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'quiz_view.desktop.dart';
import 'quiz_view.tablet.dart';
import 'quiz_view.mobile.dart';
import 'quiz_viewmodel.dart';

class QuizView extends StackedView<QuizViewModel> {
  final int lectureNumber;
  const QuizView({super.key, required this.lectureNumber});

  @override
  Widget builder(
    BuildContext context,
    QuizViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const QuizViewMobile(),
      tablet: (_) => const QuizViewTablet(),
      desktop: (_) => QuizViewDesktop(
        lectureNumber: lectureNumber,
      ),
    );
  }

  @override
  QuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuizViewModel(lectureNumber);
}
