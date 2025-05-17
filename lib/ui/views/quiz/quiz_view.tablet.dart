import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'quiz_viewmodel.dart';

class QuizViewTablet extends ViewModelWidget<QuizViewModel> {
  const QuizViewTablet({super.key});

  @override
  Widget build(BuildContext context, QuizViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - QuizView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
