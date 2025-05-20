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
                                    Icon(Icons.arrow_back, size: 16),
                                    horizontal08,
                                    Text('Back'),
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
                                children: [
                                  ElevatedButton(
                                    onPressed: viewModel.previousQuestion,
                                    child: const Text("Previous"),
                                  ),
                                  horizontal16,
                                  horizontal08,
                                  ElevatedButton(
                                    onPressed: viewModel.nextQuestion,
                                    child: const Text("Next"),
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
                                              const SizedBox(width: 8),
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
