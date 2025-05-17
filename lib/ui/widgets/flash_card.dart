import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class FlashCard extends StatelessWidget {
  final String title;
  final String content;
  const FlashCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 428,
      width: 859,
      decoration: BoxDecoration(
        color: kcGrey,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: kcBlack,
                ),
              ),
            ),
          ),
          Container(
            height: 33,
            width: double.infinity,
            color: kcLime264,
            alignment: Alignment.center,
            child: const Text(
              'Click card to reveal answer',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: kcLime314,
              ),
            ),
          ),
          vertical08,
          vertical04
        ],
      ),
    );
  }
}
