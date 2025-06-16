import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

/// 1) Reusable hover-scale + shadow
class HoverScale extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;
  const HoverScale({
    Key? key,
    required this.child,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? widget.scale : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: kcGray400,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
