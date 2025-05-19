import 'package:flutter/material.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';

class FlashCard extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onTap;
  final bool isFlipped;

  const FlashCard({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
    required this.isFlipped,
  });

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant FlashCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          double rotation = _animation.value;
          bool showFront = rotation <= 0.5;

          return Stack(
            children: [
              Visibility(
                visible: showFront,
                child: Transform(
                  transform: Matrix4.rotationY(rotation * 3.14),
                  alignment: Alignment.center,
                  child: _buildCardContent(widget.title, false),
                ),
              ),
              Visibility(
                visible: !showFront,
                child: Transform(
                  transform: Matrix4.rotationY((rotation - 1) * 3.14),
                  alignment: Alignment.center,
                  child: _buildCardContent(widget.content, true),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCardContent(String text, bool isBack) {
    return Container(
      height: 428,
      width: 859,
      decoration: BoxDecoration(
        color: kcGrey,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: kcBlack,
                ),
              ),
            ),
          ),
          if (isBack == false)
            Container(
              height: 33,
              width: double.infinity,
              color: kcLime264,
              alignment: Alignment.center,
              child: const Text(
                'Click card to reveal answer',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: kcLime314,
                ),
              ),
            ),
          vertical08,
          vertical04,
        ],
      ),
    );
  }
}
