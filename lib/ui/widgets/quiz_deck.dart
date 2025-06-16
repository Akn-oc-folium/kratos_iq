import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';

class QuizDeck extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const QuizDeck({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 126,
        width: 284,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: kcLime300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 20, color: kcZinc900),
            ),
            const Spacer(),
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
                  Icons.arrow_forward,
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
