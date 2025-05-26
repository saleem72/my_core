// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:ui';

import 'package:flutter/material.dart';

class DashedPath extends StatelessWidget {
  const DashedPath({
    super.key,
    required this.path,
    this.color = Colors.black,
    this.dashWidth = 10.0,
    this.dashSpace = 5.0,
    this.strokeWidth = 2,
  });

  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final Path Function(Size size) path;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: DashedPathPainter(
        color: color,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        strokeWidth: strokeWidth,
        path: path,
      ),
    );
  }
}

class DashedPathPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final Path Function(Size size) path;
  DashedPathPainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.path,
    required this.strokeWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final drawnPath = path(size);
    final painter = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    Path dashPath = Path();
    double distance = 0.0;

    for (PathMetric pathMetric in drawnPath.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, painter);
  }

  @override
  bool shouldRepaint(DashedPathPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DashedPathPainter oldDelegate) => false;
}
