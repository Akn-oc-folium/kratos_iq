import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/widgets/flash_card.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:stacked/stacked.dart';

import 'flashcard_viewmodel.dart';

class FlashcardViewDesktop extends StatelessWidget {
  final String lectureId;

  const FlashcardViewDesktop({super.key, required this.lectureId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FlashcardViewModel>.reactive(
      viewModelBuilder: () => FlashcardViewModel(lectureId),
      builder: (context, viewModel, child) => MainLayoutView(
        body: viewModel.isBusy
            ? material.Center(
                child: material.CircularProgressIndicator(
                  strokeWidth: 3,
                  color: kcGreen700,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, left: 64.0, right: 69.0, bottom: 64.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
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
                              Text(
                                'Flashcard ${viewModel.lectureNumber}.${viewModel.currentCardIndex + 1}',
                              ).h1,
                              vertical08,
                              vertical04,
                              Text(
                                "Lecture ${viewModel.lectureNumber}",
                              ).xLarge.h4(
                                    color: kcBlack,
                                    letterSpacing: -0.5,
                                    height: 1.4,
                                  ),
                              material.Divider(
                                height: 32,
                                color: kcBlack.withValues(alpha: 0.1),
                              ),
                              Text(
                                "${viewModel.currentCardIndex + 1}/${viewModel.flashcards.length}",
                              ).large.semiBold,
                              vertical08,
                              if (viewModel.isBusy)
                                const Center(
                                    child: material.CircularProgressIndicator())
                              else if (viewModel.currentCard != null)
                                FlashCard(
                                  title: viewModel.currentCard!.title ??
                                      'title_not_found',
                                  content: viewModel.currentCard!.content ??
                                      'content_not_found',
                                  onTap: () => viewModel.toggleFlashcard(),
                                  isFlipped: viewModel.isFlipped,
                                ),
                              vertical16,
                              vertical04,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilledButton(
                                onPressed: viewModel.previousCard,
                                style: FilledButton.styleFrom(
                                  backgroundColor: kcGray100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                                child: const Text(
                                  "Previous",
                                ).small.medium(
                                      height: 1.428,
                                      color: const Color(0xFF0F172A),
                                    ),
                              ),
                              horizontal16,
                              FilledButton(
                                onPressed: viewModel.nextCard,
                                style: FilledButton.styleFrom(
                                  backgroundColor: kcLime300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                                child: const Text(
                                  "Next",
                                ).small.semiBold(
                                      height: 1.428,
                                      color: kcZinc900,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 164),
                    SizedBox(
                      width: 284,
                      height: MediaQuery.of(context).size.height - 128,
                      child: material.Scrollbar(
                        radius: const Radius.circular(8),
                        child: ListView.builder(
                          itemCount: viewModel.flashcards.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => viewModel.goToCard(index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 24,
                                ),
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  color: viewModel.getCardStatusColor(index),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: index == viewModel.currentCardIndex
                                        ? kcSky400
                                        : material.Colors.transparent,
                                  ),
                                ),
                                child: Text(
                                  "${index + 1}. ${viewModel.flashcards[index].title}",
                                ).small.semiBold(
                                      height: 1.428,
                                      color: kcSlate700,
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
    );
  }
}
