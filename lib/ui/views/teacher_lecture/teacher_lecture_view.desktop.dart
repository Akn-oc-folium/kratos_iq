import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/audio_player.dart';
import 'package:kratos_iq/ui/widgets/metric_card.dart';
import 'package:stacked/stacked.dart';

import 'teacher_lecture_viewmodel.dart';

class TeacherLectureViewDesktop extends StatelessWidget {
  final int lectureNumber;
  const TeacherLectureViewDesktop({super.key, required this.lectureNumber});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeacherLectureViewModel>.reactive(
        viewModelBuilder: () => TeacherLectureViewModel(lectureNumber),
        builder: (context, viewModel, child) => MainLayoutView(
                body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: kcWhite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 30.0),
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
                                      color: kcLime300,
                                    ),
                                    horizontal08,
                                    Text(
                                      'Back',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: kcLime300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              vertical32,
                              const SizedBox(
                                height: 36,
                                width: 319,
                                child: Text(
                                  'Intro to Linear Algebra',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    height: 1.0,
                                    letterSpacing: -0.75,
                                  ),
                                ),
                              ),
                              vertical08,
                              vertical04,
                              const SizedBox(
                                height: 36,
                                width: 319,
                                child: Text(
                                  'May 13th, 2025',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    height: 1.0,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 39,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Lecture Impact',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                                                    backgroundImage: AssetImage(
                                                        entry['assetImage']),
                                                    title: entry['title'],
                                                    subTitle: entry['subTitle'],
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 24.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 775,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Overview',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.more_horiz,
                                        size: 24,
                                      )
                                    ],
                                  ),
                                  vertical08,
                                  vertical04,
                                  Text(
                                    viewModel.overViewContext,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  vertical16,
                                  vertical04,
                                  const Text(
                                    'Notes',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  vertical08,
                                  vertical04,
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            viewModel.notesContext.map((text) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text('• ',
                                                    style: TextStyle(
                                                        fontSize: 14)),
                                                Expanded(
                                                  child: Text(
                                                    text,
                                                    style: const TextStyle(
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Transcript',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              vertical08,
                              AudioPlayerWithTranscript(
                                audioUrl:
                                    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
                                transcript: [
                                  {
                                    'timestamp': 0,
                                    'text': 'Welcome to Linear Algebra!'
                                  },
                                  {
                                    'timestamp': 5,
                                    'text':
                                        'In this session, we’ll explore matrices.'
                                  },
                                  {
                                    'timestamp': 12,
                                    'text': 'Matrix multiplication is key.'
                                  },
                                  {
                                    'timestamp': 20,
                                    'text': 'Let’s jump into an example.'
                                  },
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
