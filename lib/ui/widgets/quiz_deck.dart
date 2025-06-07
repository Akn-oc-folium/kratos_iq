import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';

class QuizDeck extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const QuizDeck(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 96,
        width: 284,
        padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
        decoration: BoxDecoration(
          color: kcLime300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 20, color: kcZinc900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: kcLime900,
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  size: 16,
                  color: kcLime900,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
