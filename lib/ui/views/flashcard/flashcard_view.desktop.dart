import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:stacked/stacked.dart';
import 'flashcard_viewmodel.dart';
import 'package:kratos_iq/ui/widgets/flash_card.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class FlashcardViewDesktop extends StatelessWidget {
  final int lectureNumber;

  const FlashcardViewDesktop({super.key, required this.lectureNumber});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FlashcardViewModel>.reactive(
      viewModelBuilder: () => FlashcardViewModel(lectureNumber),
      builder: (context, viewModel, child) => MainLayoutView(
        body: Padding(
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
                        Row(
                          children: [
                            const Icon(Icons.arrow_back, size: 16),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () => viewModel.goBack(),
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        vertical32,
                        Text(
                          'Flashcard ${viewModel.lectureNumber}',
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        vertical08,
                        vertical04,
                        Text(
                          "Lecture ${viewModel.lectureNumber}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        vertical16,
                        vertical04,
                        const Divider(),
                        vertical08,
                        vertical04,
                        Text(
                          "${viewModel.currentCardIndex + 1}/${viewModel.flashcards.length}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        vertical08,
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (viewModel.isLoading)
                              const Center(child: CircularProgressIndicator())
                            else if (viewModel.currentCard != null)
                              FlashCard(
                                title: viewModel.currentCard!.title,
                                content: viewModel.currentCard!.content,
                                onTap: () => viewModel.toggleFlashcard(),
                                isFlipped: viewModel.isFlipped,
                              ),
                            vertical16,
                            vertical04,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: viewModel.previousCard,
                            child: const Text(
                              "Previous",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: viewModel.nextCard,
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Fixed Spacer of 164px
              const SizedBox(width: 164),

              /// Right Panel for Flashcard Navigation
              SizedBox(
                width: 284,
                height: MediaQuery.of(context).size.height - 128,
                child: Scrollbar(
                  thickness: 6,
                  radius: const Radius.circular(8),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(right: 8),
                    itemCount: viewModel.flashcards.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => viewModel.goToCard(index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: viewModel.getCardStatusColor(index),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            viewModel.flashcards[index].title,
                            style: const TextStyle(fontSize: 14),
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
