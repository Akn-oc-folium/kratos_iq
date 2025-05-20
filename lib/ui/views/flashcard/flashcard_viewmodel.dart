import 'package:flutter/material.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FlashcardViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  final int lectureNumber;
  int currentCardIndex = 0;
  List<Flashcard> flashcards = [];
  Set<int> visitedCards = {};
  bool isLoading = true;
  bool isFlipped = false;

  FlashcardViewModel(this.lectureNumber) {
    fetchFlashcards();
  }

  Future<void> fetchFlashcards() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    flashcards = List.generate(
      10,
      (index) => Flashcard(
        title: "Flashcard ${index + 1}",
        content: "Content for Flashcard ${index + 1}",
      ),
    );

    isLoading = false;
    notifyListeners();
  }

  Flashcard? get currentCard {
    if (flashcards.isEmpty) return null;
    return flashcards[currentCardIndex];
  }

  void toggleFlashcard() {
    isFlipped = !isFlipped;
    notifyListeners();
  }

  void goBack() {
    _routerService.back();
  }

  void goToCard(int index) {
    if (index >= 0 && index < flashcards.length) {
      visitedCards.add(currentCardIndex);
      currentCardIndex = index;
      isFlipped = false;
      notifyListeners();
    }
  }

  void previousCard() {
    if (currentCardIndex > 0) {
      goToCard(currentCardIndex - 1);
    }
  }

  void nextCard() {
    if (currentCardIndex < flashcards.length - 1) {
      goToCard(currentCardIndex + 1);
    }
  }

  Color getCardStatusColor(int index) {
    if (index == currentCardIndex) return kcSkyBlue; // Current card
    if (visitedCards.contains(index)) return kcLimeCCB; // Visited
    return kcSkyLightBlue; // Not visited
  }
}

class Flashcard {
  final String title;
  final String content;

  Flashcard({required this.title, required this.content});
}
