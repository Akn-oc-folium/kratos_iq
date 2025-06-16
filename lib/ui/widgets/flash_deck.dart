import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/widgets/hover_scale.dart';
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
      child: Column(
        children: [
          HoverScale(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: assetImage,
                  fit: BoxFit.cover,
                ),
              ),
              width: 160,
              height: 80,
              child: Text(label).small.semiBold(
                    height: 1.428,
                    color: Colors.white,
                  ),
            ),
          ),
          vertical04,
          SizedBox(
            width: 160,
            child: Text(
              content,
              maxLines: 2,
            ).xSmall.medium(height: 1.666),
          )
        ],
      ),
    );
  }
}
