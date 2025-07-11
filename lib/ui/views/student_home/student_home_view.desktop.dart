import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/custom_calendar.dart';
import 'package:kratos_iq/ui/widgets/flash_deck.dart';
import 'package:kratos_iq/ui/widgets/hover_scale.dart';
import 'package:kratos_iq/ui/widgets/lecture_card.dart';
import 'package:kratos_iq/ui/widgets/lecture_card_progress.dart';
import 'package:kratos_iq/ui/widgets/quiz_deck.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
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
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(
                  size: 48.0,
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 64.0, top: 24.0, right: 64.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Continue\nLearning...',
                            ).h1,
                            const SizedBox(
                              width: 90,
                            ),
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, constraints) =>
                                    SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: constraints.maxWidth,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ...viewModel.lectures
                                            .asMap()
                                            .entries
                                            .map(
                                              (entry) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16.0),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    LectureCardProgress(
                                                      cardColor:
                                                          entry.value['color'],
                                                      lectureNumber: entry
                                                          .value['lecture'],
                                                      date: entry.value['date'],
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
                                                              BoxDecoration(
                                                            color: kcLime300,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: const Icon(
                                                            Icons.chevron_right,
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
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.zinc[300],
                          height: 32,
                          thickness: 0.5,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: CustomCalendar(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.gray[100],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(64.0, 24.0, 64.0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                bottom: 40.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Lectures from April, 14')
                                      .base
                                      .bold,
                                  SizedBox(
                                    height: 150,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.all(16.0),
                                      itemCount: viewModel.lectures.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(width: 16),
                                      itemBuilder: (context, index) {
                                        final entry = viewModel.lectures[index];
                                        return HoverScale(
                                          child: LectureCard(
                                            onTap: () =>
                                                viewModel.navigateToLecturePage(
                                                    entry['lectureId']),
                                            title: entry['lecture'],
                                            subTitle: entry['date'],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  vertical16,
                                  const Text('Quizzes').base.bold,
                                  SizedBox(
                                    height: 142,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.all(16.0),
                                      itemCount: viewModel.quizzes.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(width: 16),
                                      itemBuilder: (context, index) {
                                        final entry = viewModel.quizzes[index];
                                        return HoverScale(
                                          child: QuizDeck(
                                            onTap: () =>
                                                viewModel.navigateToQuiz(
                                                    entry.lectureId),
                                            title: entry.title,
                                            subTitle:
                                                '${entry.totalQuestions} Qs',
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  vertical16,
                                  const Text('Flashcards Sets').base.bold,
                                  SizedBox(
                                    height: 174,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.all(16.0),
                                      itemCount: viewModel.flashcards.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(width: 16),
                                      itemBuilder: (context, index) {
                                        final entry =
                                            viewModel.flashcards[index];
                                        return FlashDeck(
                                          onTap: () =>
                                              viewModel.navigateToFlashCard(
                                                  entry['lectureId']),
                                          assetImage:
                                              AssetImage(entry['assetImage']),
                                          label: entry['label'],
                                          content: entry['content'],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 37,
                          ),
                          SizedBox(
                            width: 387,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Assignments or Tasks',
                                  textAlign: TextAlign.left,
                                ).base.bold,
                                vertical08,
                                Container(
                                  padding: const EdgeInsets.all(24.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 24.0,
                                    children: [
                                      ...viewModel.taskLabels
                                          .asMap()
                                          .entries
                                          .map(
                                            (entry) => Checkbox(
                                              state: viewModel
                                                  .taskSelections[entry.key],
                                              onChanged: (value) {
                                                viewModel.toggleAt(
                                                    entry.key, value);
                                              },
                                              trailing: Flexible(
                                                  child: Text(entry.value)),
                                            ).small.normal(
                                                  height: 1.714,
                                                  color: Colors.slate[700],
                                                ),
                                          )
                                          .toList(),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  Assets.images.studentQa.path,
                                  height: 115,
                                  width: double.infinity,
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
    );
  }
}
