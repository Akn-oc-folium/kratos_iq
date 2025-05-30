import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'flashcard_view.desktop.dart';
import 'flashcard_view.tablet.dart';
import 'flashcard_view.mobile.dart';
import 'flashcard_viewmodel.dart';

class FlashcardView extends StackedView<FlashcardViewModel> {
  final String lectureId;
  const FlashcardView({super.key, required this.lectureId});

  @override
  Widget builder(
    BuildContext context,
    FlashcardViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const FlashcardViewMobile(),
      tablet: (_) => const FlashcardViewTablet(),
      desktop: (_) => FlashcardViewDesktop(
        lectureId: lectureId,
      ),
    );
  }

  @override
  FlashcardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FlashcardViewModel(lectureId);
}
