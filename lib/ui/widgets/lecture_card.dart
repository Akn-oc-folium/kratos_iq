import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class LectureCard extends StatelessWidget {
  final Color cardColor;
  final String lectureNumber;
  final String date;
  const LectureCard(
      {super.key,
      required this.cardColor,
      required this.lectureNumber,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 284,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lectureNumber,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 20, color: kcWhite),
              ),
              const Icon(
                Icons.close,
                size: 16,
                color: kcWhite,
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: kcWhite),
          ),
          vertical04,
          vertical08,
          const LinearProgressIndicator(
            value: 0.5,
            color: kcWhite,
            backgroundColor: kcLime30D,
          ),
        ],
      ),
    );
  }
}
