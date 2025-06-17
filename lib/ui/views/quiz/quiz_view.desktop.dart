import 'package:flutter/material.dart' as material;
import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/quiz_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:stacked/stacked.dart';

import 'quiz_viewmodel.dart';

class QuizViewDesktop extends StatelessWidget {
  final String lectureId;
  const QuizViewDesktop({super.key, required this.lectureId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuizViewModel>.reactive(
      viewModelBuilder: () => QuizViewModel(lectureId),
      builder: (context, viewModel, child) => MainLayoutView(
        body: viewModel.isBusy
            ? material.Center(
                child: material.CircularProgressIndicator(
                  strokeWidth: 3,
                  color: kcGreen700,
                ),
              )
            : SizedBox.expand(
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
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    size: 16,
                                    color: kcLime600,
                                  ),
                                  horizontal08,
                                  const Text('Back').small.medium(
                                        height: 1.428,
                                        color: kcLime600,
                                      ),
                                ],
                              ),
                            ),
                            vertical32,
                            Text('Quiz ${viewModel.lectureId.split('-')[0]}')
                                .h1,
                            vertical08,
                            const Text('Lecture 1').xLarge.h4(
                                  color: kcBlack,
                                  letterSpacing: -0.5,
                                  height: 1.4,
                                ),
                            vertical16,
                            vertical04,
                            SizedBox(
                              height: 28,
                              width: 907,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: LinearProgressIndicator(
                                  value: viewModel.progress,
                                  backgroundColor: kcGray200,
                                  color: kcLime500,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                            Divider(
                              color: kcBlack.withValues(alpha: 0.1),
                              height: 24,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    vertical08,
                                    if (viewModel.isFinished)
                                      const Text(
                                        "You're done! Let's see how you did",
                                      ).large.semiBold(
                                            height: 1.55,
                                            color: const Color(0xFF2C2C2C),
                                          ),
                                    vertical08,
                                    if (viewModel.isFinished)
                                      _buildResultScreen(viewModel)
                                    else
                                      QuizCard(
                                        questionNumber:
                                            "Question ${viewModel.currentQuestionIndex + 1}/${viewModel.questions.length}",
                                        question: viewModel
                                                .currentQuestion?.question ??
                                            '',
                                        options: viewModel
                                                .currentQuestion?.options ??
                                            [],
                                        correctIndex: viewModel.currentQuestion
                                                ?.correctIndex ??
                                            0,
                                        questionIndex:
                                            viewModel.currentQuestionIndex,
                                      ),
                                    vertical16,
                                    vertical04,
                                  ],
                                ),
                              ),
                            ),
                            vertical16,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                material.FilledButton(
                                  onPressed: viewModel.previousQuestion,
                                  style: material.FilledButton.styleFrom(
                                    backgroundColor: kcGray100,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: const Text("Previous").small.medium(
                                        height: 1.428,
                                        color: const Color(0xFF0F172A),
                                      ),
                                ),
                                horizontal16,
                                material.FilledButton(
                                  onPressed: viewModel.nextQuestion,
                                  style: material.FilledButton.styleFrom(
                                    backgroundColor: kcLime300,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: const Text("Next").small.semiBold(
                                        height: 1.428,
                                        color: kcZinc900,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 117),
                      SizedBox(
                        width: 284,
                        height: 772,
                        child: viewModel.isBusy
                            ? const SizedBox()
                            : ListView.builder(
                                itemCount: viewModel.totalQuestions,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => viewModel.goToQuestion(index),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 24,
                                      ),
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        color: viewModel
                                            .getQuestionStatusColor(index),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: index ==
                                                  viewModel.currentQuestionIndex
                                              ? kcSky400
                                              : Colors.transparent,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            viewModel
                                                .getQuestionStatusIcon(index),
                                            size: 16,
                                            color: viewModel
                                                        .getQuestionStatusIcon(
                                                            index) ==
                                                    Icons.check_circle
                                                ? kcLime600
                                                : viewModel.getQuestionStatusIcon(
                                                            index) ==
                                                        Icons.cancel
                                                    ? kcRed400
                                                    : kcSky400,
                                          ),
                                          horizontal08,
                                          Text("Question ${index + 1}")
                                              .small
                                              .semiBold(
                                                height: 1.428,
                                                color: kcSlate700,
                                              ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

Widget _buildResultScreen(QuizViewModel viewModel) {
  return Container(
    width: 907,
    height: 420,
    padding: const EdgeInsets.all(48),
    decoration: BoxDecoration(
      color: const Color(0xFFF9FAFB),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.images.celebration.path,
          width: 101,
          height: 101,
        ),
        vertical32,
        vertical04,
        Text(viewModel.resultText).h1(color: kcIndigo600),
        vertical08,
        const Text('Points').large.semiBold(color: kcIndigo600),
        vertical32,
        vertical04,
        const Text('You did awesome!').h4.xLarge(color: kcBlack),
        vertical08,
        vertical04,
        Text(
          "${viewModel.retention.toStringAsFixed(0)}% retained from lecture content",
        ).base.medium(color: kcGray600),
      ],
    ),
  );
}
