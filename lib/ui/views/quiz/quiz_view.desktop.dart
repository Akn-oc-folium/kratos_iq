import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/quiz_card.dart';
import 'package:stacked/stacked.dart';

import 'quiz_viewmodel.dart';

class QuizViewDesktop extends StatelessWidget {
  final int lectureNumber;
  const QuizViewDesktop({super.key, required this.lectureNumber});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuizViewModel>.reactive(
        viewModelBuilder: () => QuizViewModel(lectureNumber),
        builder: (context, viewModel, child) => MainLayoutView(
              body: SizedBox.expand(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 69.0, vertical: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: viewModel.goBack,
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      size: 16,
                                      color: kcLime30D,
                                    ),
                                    horizontal08,
                                    Text(
                                      'Back',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kcLime30D),
                                    ),
                                  ],
                                ),
                              ),
                              vertical32,
                              Text(
                                'Quiz ${viewModel.lectureNumber}',
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              vertical08,
                              const Text(
                                'Lecture 1',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 39,
                              ),
                              SizedBox(
                                height: 28,
                                width: 907,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: LinearProgressIndicator(
                                    value: viewModel.progress,
                                    backgroundColor: kcVeryLightGrey,
                                    color: kcLimeC16,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              vertical08,
                              vertical04,
                              const Divider(
                                color: kcZinc,
                              ),
                              vertical16,
                              vertical04,
                              if (viewModel.isLoading)
                                const SizedBox()
                              else if (viewModel.isFinished)
                                _buildResultScreen(viewModel)
                              else
                                QuizCard(
                                  questionNumber:
                                      "Question ${viewModel.currentQuestionIndex + 1}/${viewModel.questions.length}",
                                  question:
                                      viewModel.currentQuestion?.question ?? '',
                                  options:
                                      viewModel.currentQuestion?.options ?? [],
                                  correctIndex:
                                      viewModel.currentQuestion?.correctIndex ??
                                          0,
                                  questionIndex: viewModel.currentQuestionIndex,
                                ),
                              vertical16,
                              vertical04,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: viewModel.previousQuestion,
                                    child: const Text(
                                      "Previous",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  horizontal16,
                                  horizontal08,
                                  ElevatedButton(
                                    onPressed: viewModel.nextQuestion,
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(kcLime264),
                                    ),
                                    child: viewModel.isFinished
                                        ? const Text(
                                            "Next Quiz",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )
                                        : const Text(
                                            "Next",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 117),
                        Expanded(
                          flex: 0,
                          child: SizedBox(
                            width: 284,
                            height: 772,
                            child: viewModel.isLoading
                                ? const SizedBox()
                                : ListView.builder(
                                    itemCount: viewModel.totalQuestions,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () =>
                                            viewModel.goToQuestion(index),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: viewModel
                                                .getQuestionStatusColor(index),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                viewModel.getQuestionStatusIcon(
                                                    index),
                                                size: 16,
                                                color: viewModel
                                                            .getQuestionStatusIcon(
                                                                index) ==
                                                        Icons.check_circle
                                                    ? kcLimeCCB
                                                    : viewModel.getQuestionStatusIcon(
                                                                index) ==
                                                            Icons.cancel
                                                        ? kcRedError
                                                        : Colors.grey,
                                              ),
                                              horizontal08,
                                              Text("Question ${index + 1}"),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}

Widget _buildResultScreen(QuizViewModel viewModel) {
  return Container(
    width: 907,
    height: 420,
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: kcGrey,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.celebration, size: 48, color: Colors.deepPurple),
        vertical16,
        Text(
          viewModel.resultText,
          style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
        const Text(
          'Points',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        vertical16,
        const Text(
          'You did awesome!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "${viewModel.retention.toStringAsFixed(0)}% retained from lecture content",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        vertical32,
      ],
    ),
  );
}
