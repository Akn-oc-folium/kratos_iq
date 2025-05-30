import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/flash_deck.dart';
import 'package:kratos_iq/ui/widgets/lecture_card.dart';
import 'package:kratos_iq/ui/widgets/quiz_deck.dart';
import 'package:stacked/stacked.dart';

import 'student_home_viewmodel.dart';

class StudentHomeViewDesktop extends StatelessWidget {
  const StudentHomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentHomeViewModel>.reactive(
        viewModelBuilder: () => StudentHomeViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) => MainLayoutView(
              body: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            color: kcWhite,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 64.0, vertical: 24.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 96,
                                    width: 338,
                                    child: Text(
                                      'Continue\nLearning...',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w800,
                                        height: 1.0,
                                        letterSpacing: -0.6,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          ...viewModel.lectures
                                              .asMap()
                                              .entries
                                              .map(
                                                (entry) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16.0),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      LectureCard(
                                                        cardColor: entry
                                                            .value['color'],
                                                        lectureNumber: entry
                                                            .value['lecture'],
                                                        date:
                                                            entry.value['date'],
                                                      ),
                                                      if (entry.key ==
                                                          viewModel.lectures
                                                                  .length -
                                                              1)
                                                        Positioned(
                                                          top: 39,
                                                          left: 273,
                                                          child: Container(
                                                            height: 24,
                                                            width: 24,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: kcLime264,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: const Icon(
                                                              Icons
                                                                  .chevron_right,
                                                              size: 16,
                                                              color: kcBlack,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 64.0, vertical: 24.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 888,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Lectures from April, 14',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        vertical08,
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...viewModel.lectures
                                                  .map(
                                                    (entry) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 16.0),
                                                      child: Row(
                                                        children: [
                                                          LectureCard(
                                                            onTap: () => viewModel
                                                                .navigateToLecturePage(
                                                                    entry[
                                                                        'lectureId']),
                                                            cardColor:
                                                                entry['color'],
                                                            lectureNumber:
                                                                entry[
                                                                    'lecture'],
                                                            date: entry['date'],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ],
                                          ),
                                        ),
                                        vertical16,
                                        vertical08,
                                        const Text(
                                          'Quizzes',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        vertical08,
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              ...viewModel.quizzes
                                                  .map((entry) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 16.0),
                                                        child: QuizDeck(
                                                          onTap: () => viewModel
                                                              .navigateToQuiz(
                                                                  entry
                                                                      .lectureId),
                                                          title: entry.title,
                                                          subTitle:
                                                              '${entry.totalQuestions} Qs',
                                                        ),
                                                      ))
                                            ],
                                          ),
                                        ),
                                        vertical16,
                                        vertical08,
                                        const Text(
                                          'Flashcards Sets',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        vertical08,
                                        Row(
                                          children: [
                                            ...viewModel.flashcards
                                                .map((entry) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 16.0),
                                                      child: FlashDeck(
                                                        onTap: () => viewModel
                                                            .navigateToFlashCard(
                                                                entry[
                                                                    'lectureId']),
                                                        assetImage: AssetImage(
                                                            entry[
                                                                'assetImage']),
                                                        label: entry['label'],
                                                        content:
                                                            entry['content'],
                                                      ),
                                                    ))
                                                .toList(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 37,
                                  ),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Assignments or Tasks',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ));
  }
}
