import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'flashcard_viewmodel.dart';

class FlashcardViewMobile extends ViewModelWidget<FlashcardViewModel> {
  const FlashcardViewMobile({super.key});

  @override
  Widget build(BuildContext context, FlashcardViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - FlashcardView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
