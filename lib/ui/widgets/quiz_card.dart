import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/quiz/quiz_viewmodel.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
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
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: kcGray50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionNumber,
          ).base.normal(color: kcGray400, height: 1.5),
          vertical08,
          Text(
            question,
          ).h4(height: 1.55, color: const Color(0xFF2C2C2C)),
          vertical16,
          vertical08,
          ...List.generate(
            options.length,
            (index) {
              return QuizOption(
                optionText: options[index],
                index: index,
                isSelected: selectedOption == index,
                isCorrect: selectedOption != null && index == correctIndex,
                onTap: () => viewModel.selectOption(questionIndex, index),
              );
            },
          ),
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
    Color borderColor = isSelected
        ? isCorrect
            ? kcGreen500
            : kcRed300
        : kcGray200;
    Color backgroundColor = kcWhite;

    if (isSelected && isCorrect) {
      borderColor = kcGreen500;
      backgroundColor = kcLime100;
    } else if (isSelected && !isCorrect) {
      borderColor = kcRed300;
      backgroundColor = kcRed100;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. $optionText",
            ).textSmall(color: kcBlack),
            Icon(
              isSelected
                  ? (Icons.radio_button_checked)
                  : Icons.radio_button_unchecked,
              color:
                  isSelected ? (isCorrect ? kcGreen400 : kcRed400) : kcSlate200,
            ),
          ],
        ),
      ),
    );
  }
}
