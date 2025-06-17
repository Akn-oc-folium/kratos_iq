import 'package:flutter/material.dart' as material;
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
      builder: (context, vm, child) => MainLayoutView(
        body: vm.isBusy
            ? Center(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: vm.goBack,
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
                            'Flashcard ${vm.lectureNumber}.${vm.currentCardIndex + 1}',
                          ).h1,
                          vertical08,
                          vertical04,
                          Text(
                            "Lecture ${vm.lectureNumber}",
                          ).xLarge.h4(
                                color: kcBlack,
                                letterSpacing: -0.5,
                                height: 1.4,
                              ),
                          Divider(
                            height: 32,
                            color: kcBlack.withValues(alpha: 0.1),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    "${vm.currentCardIndex + 1}/${vm.flashcards.length}",
                                  ).large.semiBold,
                                  vertical08,
                                  if (vm.currentCard != null)
                                    FlashCard(
                                      title: vm.currentCard!.title ??
                                          'title_not_found',
                                      content: vm.currentCard!.content ??
                                          'content_not_found',
                                      onTap: vm.toggleFlashcard,
                                      isFlipped: vm.isFlipped,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          vertical16,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              material.FilledButton(
                                onPressed: vm.previousCard,
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
                                onPressed: vm.nextCard,
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
                    const SizedBox(width: 164),
                    SizedBox(
                      width: 284,
                      height: MediaQuery.of(context).size.height - 128,
                      child: Scrollbar(
                        radius: const Radius.circular(8),
                        child: ListView.builder(
                          itemCount: vm.flashcards.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => vm.goToCard(index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 24,
                                ),
                                margin: const EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                  color: vm.getCardStatusColor(index),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: index == vm.currentCardIndex
                                        ? kcSky400
                                        : Colors.transparent,
                                  ),
                                ),
                                child: Text(
                                  "${index + 1}. ${vm.flashcards[index].title}",
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
