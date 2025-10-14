//

import 'package:flutter/material.dart';

import 'circular_notched_container.dart';

class AnimatedNavBackground extends StatefulWidget {
  const AnimatedNavBackground({
    super.key,
    required this.xOffset,
    required this.circleWidth,
    this.gradient,
  });
  final double xOffset;
  final double circleWidth;
  final Gradient? gradient;
  @override
  State<AnimatedNavBackground> createState() => _AnimatedNavBackgroundState();
}

class _AnimatedNavBackgroundState extends State<AnimatedNavBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _offsetAnimation;

  double offset = 0;

  final Gradient _defaultGradient = const LinearGradient(
    colors: [
      Color(0xff004e8f),
      Color(0xff72c6ef),
    ],
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _offsetAnimation = Tween<double>(begin: offset, end: widget.xOffset)
        .animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant AnimatedNavBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.xOffset != widget.xOffset) {
      _offsetAnimation = Tween<double>(begin: offset, end: widget.xOffset)
          .animate(_animationController);
      setState(() {
        offset = widget.xOffset;
      });

      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final circleWidth = widget.circleWidth;
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              Transform.translate(
                offset: Offset(_offsetAnimation.value - circleWidth * 0.5,
                    -circleWidth * 0.5 - 8),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: widget.gradient ?? _defaultGradient,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              CircularNotchedContainer(
                offset: _offsetAnimation.value - 32,
                gradient: widget.gradient ?? _defaultGradient,
                notchRadius: 32,
                notchDepth: 1,
              ),
            ],
          );
        });
  }
}
