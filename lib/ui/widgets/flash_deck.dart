import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class FlashDeck extends StatelessWidget {
  final AssetImage assetImage;
  final String label;
  final String content;
  final VoidCallback onTap;

  const FlashDeck(
      {super.key,
      required this.assetImage,
      required this.label,
      required this.content,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 124,
        width: 158,
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: assetImage,
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: [
                Positioned(
                  left: 19,
                  bottom: 15,
                  child: SizedBox(
                    width: 103,
                    child: Text(
                      label,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: kcWhite),
                    ),
                  ),
                ),
              ]),
            ),
            vertical04,
            Text(
              content,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
