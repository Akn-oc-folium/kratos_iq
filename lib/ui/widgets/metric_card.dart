import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color cardColor;
  const MetricCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 209,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardColor,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: kcWhite),
          ),
          vertical08,
          Text(
            subTitle,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: kcWhite),
          ),
        ],
      ),
    );
  }
}
