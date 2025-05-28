import 'package:flutter/material.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:kratos_iq/models/flashcard_overview_model.dart';
import 'package:kratos_iq/services/api_service.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FlashcardViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final ApiService _apiService = locator<ApiService>();
  final String lectureId;

  int currentCardIndex = 0;
  List<FlashCardDatum> flashcards = [];
  Set<int> visitedCards = {};
  bool isLoading = true;
  bool isFlipped = false;

  FlashcardViewModel(this.lectureId) {
    fetchFlashcards(lectureId);
  }

  Future<void> fetchFlashcards(String lectureId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _apiService.getFlashCards(lectureId);
      flashcards = response.data;

      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching flashcard overview: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  FlashCardDatum? get currentCard {
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
    if (index == currentCardIndex) return kcSkyBlue;
    if (visitedCards.contains(index)) return kcLimeCCB;
    return kcSkyLightBlue;
  }
}
