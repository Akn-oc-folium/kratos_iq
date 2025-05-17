import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';

class QuizDeckCard extends StatelessWidget {
  final String title;
  final String subTitle;
  const QuizDeckCard({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 284,
      padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
      decoration: BoxDecoration(
        color: kcGreenColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: kcZinc),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: kcLime314),
              ),
              const Icon(
                Icons.arrow_right_alt,
                size: 16,
                color: kcLime314,
              )
            ],
          )
        ],
      ),
    );
  }
}
