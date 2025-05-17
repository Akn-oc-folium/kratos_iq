import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/quiz/quiz_viewmodel.dart';
import 'package:stacked/stacked.dart';

class QuizCard extends ViewModelWidget<QuizViewModel> {
  final String questionNumber;
  final String question;
  final List<String> options;
  final int correctIndex;
  final int questionIndex;

  const QuizCard({
    super.key,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.questionNumber,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context, QuizViewModel viewModel) {
    int? selectedOption = viewModel.getSelectedOption(questionIndex);

    return Container(
      width: 907,
      height: 420,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: kcSlate,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionNumber,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
          vertical08,
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          vertical16,
          ...List.generate(options.length, (index) {
            return QuizOption(
              optionText: options[index],
              index: index,
              isSelected: selectedOption == index,
              isCorrect: selectedOption != null && index == correctIndex,
              onTap: () => viewModel.selectOption(questionIndex, index),
            );
          }),
        ],
      ),
    );
  }
}

class QuizOption extends StatelessWidget {
  final String optionText;
  final int index;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const QuizOption({
    super.key,
    required this.optionText,
    required this.index,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey;
    Color backgroundColor = Colors.white;

    if (isSelected && isCorrect) {
      borderColor = Colors.green;
      backgroundColor = Colors.green.withOpacity(0.1);
    } else if (isSelected && !isCorrect) {
      borderColor = Colors.red;
      backgroundColor = Colors.red.withOpacity(0.1);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. $optionText",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            Icon(
              isSelected
                  ? (Icons.radio_button_checked)
                  : Icons.radio_button_unchecked,
              color: isSelected
                  ? (isCorrect ? Colors.green : Colors.red)
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
