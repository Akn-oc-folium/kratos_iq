import 'package:flutter/material.dart' as material;
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class LectureCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final bool isLecture;

  const LectureCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : isLecture = false;

  const LectureCard.teacher({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : isLecture = true;

  @override
  State<LectureCard> createState() => _LectureCardState();
}

class _LectureCardState extends State<LectureCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 108,
        width: 214,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: widget.isLecture ? const Color(0xFF87DD81) : kcWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
            ).h4.xLarge(height: 1.4, color: kcBlack, letterSpacing: -0.2),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.subTitle,
                ).small.medium(color: kcZinc900),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kcLime300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const material.Icon(
                    material.Icons.play_arrow_outlined,
                    size: 24,
                    color: kcBlack,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
