import 'package:flutter/material.dart';
import 'package:kratos_iq/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuizViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  final int lectureNumber;
  int currentQuestionIndex = 0;
  List<Question> questions = [];
  Set<int> answeredQuestions = {};
  Map<int, int?> selectedOptions = {};
  Map<int, bool> hasNavigated = {};
  bool isLoading = true;

  QuizViewModel(this.lectureNumber) {
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    questions = List.generate(
      13,
      (index) => Question(
        question:
            'Which of the following best describes the Second Law of Thermodynamics?',
        options: [
          'Energy cannot be created or destroyed, only transformed.',
          'Energy cannot be created or destroyed, only transformed.',
          'Energy cannot be created or destroyed, only transformed.',
          'Energy cannot be created or destroyed, only transformed.'
        ],
        correctIndex: index % 4,
      ),
    );

    selectedOptions = {for (int i = 0; i < questions.length; i++) i: null};
    hasNavigated = {for (int i = 0; i < questions.length; i++) i: false};

    isLoading = false;
    notifyListeners();
  }

  Question? get currentQuestion =>
      questions.isNotEmpty ? questions[currentQuestionIndex] : null;

  double get progress =>
      questions.isEmpty ? 0 : answeredQuestions.length / questions.length;

  int get totalQuestions => questions.length;

  int get correctAnswers => selectedOptions.entries
      .where((entry) =>
          entry.value != null &&
          entry.value == questions[entry.key].correctIndex)
      .length;

  String get resultText => "$correctAnswers/${questions.length}";

  double get retention => (correctAnswers / questions.length) * 100;

  int? getSelectedOption(int questionIndex) {
    return selectedOptions[questionIndex];
  }

  void goBack() {
    _routerService.back();
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < questions.length) {
      hasNavigated[currentQuestionIndex] = true;
      currentQuestionIndex = index;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      goToQuestion(currentQuestionIndex - 1);
    }
  }

  bool isFinished = false;

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      goToQuestion(currentQuestionIndex + 1);
    } else {
      isFinished = true;
      notifyListeners();
    }
  }

  void selectOption(int questionIndex, int optionIndex) {
    selectedOptions[questionIndex] = optionIndex;

    if (!answeredQuestions.contains(questionIndex)) {
      answeredQuestions.add(questionIndex);
    }

    notifyListeners();
  }

  Color getQuestionStatusColor(int index) {
    if (index == currentQuestionIndex) {
      return Colors.blue.shade100;
    }

    if (answeredQuestions.contains(index) && hasNavigated[index] == true) {
      int? selectedOption = selectedOptions[index];
      if (selectedOption == questions[index].correctIndex) {
        return Colors.green.shade100;
      }
      return Colors.red.shade100;
    }

    return Colors.grey.shade200;
  }

  IconData getQuestionStatusIcon(int index) {
    if (answeredQuestions.contains(index) && hasNavigated[index] == true) {
      int? selectedOption = selectedOptions[index];
      if (selectedOption == questions[index].correctIndex) {
        return Icons.check_circle;
      }
      return Icons.cancel;
    }

    return Icons.radio_button_unchecked;
  }
}

class Question {
  final String question;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}
