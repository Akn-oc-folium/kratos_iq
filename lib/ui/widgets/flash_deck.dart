import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

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
        width: 160,
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
              child: Stack(
                children: [
                  Positioned(
                    left: 19,
                    bottom: 15,
                    child: SizedBox(
                      width: 103,
                      child: Text(label).small.semiBold(
                            height: 1.428,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            vertical04,
            Text(
              content,
              maxLines: 2,
            ).xSmall.medium(height: 1.666)
          ],
        ),
      ),
    );
  }
}
