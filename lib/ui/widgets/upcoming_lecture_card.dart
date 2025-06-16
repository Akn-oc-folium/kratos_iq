import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class UpcomingLectureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const UpcomingLectureCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: kcLime300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title).h4(fontSize: 20, color: kcZinc900, height: 1.4),
                  const SizedBox(height: 8),
                  Text(subtitle).small.semiBold(
                        color: kcLime900,
                        height: 1.428,
                      ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: kcLime900,
            ),
          ],
        ),
      ),
    );
  }
}
