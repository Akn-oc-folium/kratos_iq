import 'package:flutter/material.dart' as material;
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/audio_player.dart';
import 'package:kratos_iq/ui/widgets/date_formatter.dart';
import 'package:kratos_iq/ui/widgets/supplementary_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:stacked/stacked.dart';

import 'student_dashboard_viewmodel.dart';

class StudentDashboardViewDesktop extends StatelessWidget {
  final String lectureId;
  const StudentDashboardViewDesktop({super.key, required this.lectureId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StudentDashboardViewModel>.reactive(
      viewModelBuilder: () => StudentDashboardViewModel(lectureId),
      onViewModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => MainLayoutView(
        body: viewModel.isBusy
            ? Center(
                child: material.CircularProgressIndicator(
                  color: kcGreen700,
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
                                SizedBox(
                                  height: 36,
                                  width: 320,
                                  child: Text(
                                    viewModel.lectureDetails?.data?.title ?? '',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Supplementary Resources',
                                  ).base.bold(color: kcBlack, height: 1.6),
                                  vertical08,
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: viewModel.lectureDetails?.data
                                              ?.supplementaryResources
                                              ?.asMap()
                                              .entries
                                              .map((entry) {
                                            final index = entry.key;
                                            final resource = entry.value;
                                            final total = viewModel
                                                .lectureDetails!
                                                .data!
                                                .supplementaryResources!
                                                .length;

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  // Your deck widget (pass in whatever image or icon you need)
                                                  SupplementaryDeck(
                                                    assetImage:
                                                        viewModel.assetImages[
                                                            index %
                                                                viewModel
                                                                    .assetImages
                                                                    .length],
                                                    bgColor: viewModel
                                                            .lectureColors[
                                                        index %
                                                            viewModel
                                                                .lectureColors
                                                                .length],
                                                    label:
                                                        resource.resource ?? '',
                                                    onTap: () => viewModel
                                                        .openSupplementaryLink(
                                                            resource.link),
                                                  ),

                                                  // If this is the last item, show the chevron
                                                  if (index == total - 1)
                                                    Positioned(
                                                      top: 39,
                                                      left: 273,
                                                      child:
                                                          material.CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor:
                                                            kcLime300,
                                                        child: Icon(
                                                          Icons.chevron_right,
                                                          size: 16,
                                                          color: kcZinc900,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            );
                                          }).toList() ??
                                          [],
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
                          horizontal: 64.0, vertical: 24.0),
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
                              child: SingleChildScrollView(
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
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
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
