import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget child;
  final double? x;
  final double? y;
  // You can also pass the translation in here if you want to
  const TranslateOnHover({super.key, required this.child, this.x, this.y});

  @override
  State<TranslateOnHover> createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
    final hoverTransform = Matrix4.identity()
      ..translate(widget.x ?? 0, widget.y ?? 0);
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovering ? hoverTransform : nonHoverTransform,
        child: widget.child,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
