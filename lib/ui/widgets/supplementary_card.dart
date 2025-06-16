import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SupplementaryDeck extends StatelessWidget {
  final String assetImage;
  final String label;
  final VoidCallback onTap;
  final Color bgColor;

  const SupplementaryDeck({
    super.key,
    required this.assetImage,
    required this.label,
    required this.onTap,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 214,
        height: 108,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(assetImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(LucideIcons.externalLink, size: 16, color: kcWhite),
            ),
            const Spacer(),
            Text(
              label,
              maxLines: 3,
            ).small.semiBold(
                  height: 1.428,
                  color: Colors.white,
                ),
          ],
        ),
      ),
    );
  }
}
