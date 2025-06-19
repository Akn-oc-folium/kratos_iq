import 'package:flutter/material.dart' as material;
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/audio_player.dart';
import 'package:kratos_iq/ui/widgets/date_formatter.dart';
import 'package:kratos_iq/ui/widgets/metric_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:stacked/stacked.dart';

import 'teacher_lecture_viewmodel.dart';

class TeacherDashboardViewDesktop extends StatelessWidget {
  final int lectureNumber;
  final String lectureId;
  const TeacherDashboardViewDesktop(
      {super.key, required this.lectureNumber, required this.lectureId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherDashboardViewModel>.reactive(
      viewModelBuilder: () =>
          TeacherDashboardViewModel(lectureNumber, lectureId),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => MainLayoutView(
        body: viewModel.isBusy
            ? Center(
                child: material.CircularProgressIndicator(
                  color: kcLime300,
                  strokeWidth: 3,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: kcGray100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 64.0,
                          vertical: 30.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                      const Text(
                                        'Back',
                                      ).small.medium(
                                            height: 1.428,
                                            color: kcLime600,
                                          ),
                                    ],
                                  ),
                                ),
                                vertical32,
                                SizedBox(
                                  height: 36,
                                  width: 320,
                                  child: Text(
                                    'Lecture ${viewModel.lectureDetails?.data?.lectureNumber ?? ''}',
                                  ).h3(
                                    letterSpacing: -0.75,
                                    height: 1.2,
                                    color: kcBlack,
                                  ),
                                ),
                                vertical08,
                                vertical04,
                                SizedBox(
                                  height: 36,
                                  width: 320,
                                  child: Text(
                                    DateFormatter().formatWithOrdinal(
                                      viewModel
                                              .lectureDetails?.data?.lectureDate
                                              ?.toString() ??
                                          '',
                                    ),
                                  ).h4.xLarge(
                                        color: kcBlack,
                                        height: 1.4,
                                        letterSpacing: -0.5,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Lecture Impact',
                                  ).base.bold(color: kcBlack, height: 1.6),
                                  vertical08,
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
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
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 64.0,
                        vertical: 24.0,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 775,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Topics',
                                  ).xLarge.h4(
                                        color: kcBlack,
                                        letterSpacing: -0.5,
                                        height: 1.4,
                                      ),
                                  vertical08,
                                  vertical04,
                                  Text(
                                    viewModel.lectureDetails?.data?.topics
                                            .toString() ??
                                        '',
                                  ).small.medium(
                                        color: kcSlate700,
                                        height: 1.714,
                                      ),
                                  vertical16,
                                  vertical04,
                                  const Text('Summary').xLarge.h4(
                                        color: kcBlack,
                                        letterSpacing: -0.5,
                                        height: 1.4,
                                      ),
                                  vertical08,
                                  vertical04,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      viewModel.lectureDetails?.data?.summary
                                              .toString() ??
                                          '',
                                    ).small.medium(
                                          color: kcSlate700,
                                          height: 1.714,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Transcript').xLarge.h4(
                                    color: kcBlack,
                                    letterSpacing: -0.5,
                                    height: 1.4,
                                  ),
                              vertical08,
                              AudioPlayerWithTranscript(
                                audioUrl: viewModel.audioUrl.toString(),
                                transcript: viewModel.transcript.toString(),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
