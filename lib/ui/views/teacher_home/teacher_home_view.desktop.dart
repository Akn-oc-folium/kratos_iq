import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/widgets/lecture_card.dart';
import 'package:kratos_iq/ui/widgets/metric_card.dart';
import 'package:stacked/stacked.dart';

import 'teacher_home_viewmodel.dart';

class TeacherHomeViewDesktop extends ViewModelWidget<TeacherHomeViewModel> {
  const TeacherHomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, TeacherHomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcGrey,
      body: SingleChildScrollView(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 96,
                      width: 338,
                      child: Text(
                        'Your Impact at\n a Glance',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          height: 1.0,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...viewModel.teacherMetric
                                .map(
                                  (entry) => Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Row(
                                      children: [
                                        MetricCard(
                                          cardColor: entry['color'],
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Class 10 Lectures from April, 14',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
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
                                            const EdgeInsets.only(right: 16.0),
                                        child: Row(
                                          children: [
                                            LectureCard(
                                              cardColor: entry['color'],
                                              lectureNumber: entry['lecture'],
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 37,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upcoming Lectures for April, 17',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
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
