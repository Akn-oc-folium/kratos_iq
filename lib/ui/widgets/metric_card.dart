import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final AssetImage backgroundImage;
  const MetricCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: 213,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black
              .withOpacity(0.3), // Optional: dark overlay for contrast
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: kcWhite,
              ),
            ),
            vertical08,
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kcWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
