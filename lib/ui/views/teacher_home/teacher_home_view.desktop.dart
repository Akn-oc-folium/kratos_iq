import 'package:kratos_iq/gen/assets.gen.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/custom_calendar.dart';
import 'package:kratos_iq/ui/widgets/lecture_card.dart';
import 'package:kratos_iq/ui/widgets/metric_card.dart';
import 'package:kratos_iq/ui/widgets/upcoming_lecture_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:stacked/stacked.dart';

import 'teacher_home_viewmodel.dart';

class TeacherHomeViewDesktop extends StatelessWidget {
  const TeacherHomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherHomeViewModel>.reactive(
      viewModelBuilder: () => TeacherHomeViewModel(),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 64.0, vertical: 24.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Your Impact at\n a Glance',
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
                                      children: [
                                        ...viewModel.teacherMetric
                                            .map(
                                              (entry) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16.0),
                                                child: Row(
                                                  children: [
                                                    MetricCard(
                                                      backgroundImage:
                                                          AssetImage(entry[
                                                              'assetImage']),
                                                      title: entry['title'],
                                                      subTitle:
                                                          entry['subTitle'],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
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
                      padding: const EdgeInsets.only(
                          left: 64.0, top: 24.0, right: 64.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Class 10 Lectures from April, 14')
                                    .base
                                    .bold,
                                vertical08,
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...viewModel.lectures
                                          .map(
                                            (entry) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0),
                                              child: Row(
                                                children: [
                                                  LectureCard(
                                                    onTap: () => viewModel
                                                        .navigateToLecturePage(
                                                            entry[
                                                                'lectureNumber']),
                                                    cardColor: entry['color'],
                                                    lectureNumber:
                                                        entry['lecture'],
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
                                const Text('Weekly Timetable').base.bold,
                                vertical08,
                                Image.asset(Assets.images.timetable.path),
                              ],
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
                                  'Upcoming Lectures for April, 17',
                                  textAlign: TextAlign.left,
                                ).base.bold,
                                const SizedBox(height: 8),
                                UpcomingLectureCard(
                                  title: 'Sequences & Series (AP/GP)',
                                  subtitle: 'Classs 10',
                                  onTap: () {},
                                ),
                                const SizedBox(height: 6),
                                UpcomingLectureCard(
                                  title: 'Matrices & Determinants',
                                  subtitle: 'Classs 8',
                                  onTap: () {},
                                ),
                                const SizedBox(height: 6),
                                UpcomingLectureCard(
                                  title: 'Permutations & Combinations',
                                  subtitle: 'Classs 11',
                                  onTap: () {},
                                ),
                                const SizedBox(height: 14),
                                const Spacer(),
                                Image.asset(
                                  Assets.images.createFlashcardBanner.path,
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
