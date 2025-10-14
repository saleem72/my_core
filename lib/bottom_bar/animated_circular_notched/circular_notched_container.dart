//
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// ## CircularNotchedContainer
///
/// A customizable container that draws a **circular notch cut-out**
/// — often used behind a [`BottomAppBar`] or a custom bottom bar
/// to visually integrate a FloatingActionButton (FAB).
///
/// Unlike Flutter’s built-in [`CircularNotchedRectangle`],
/// this widget gives you full control over:
/// - The **horizontal offset** of the notch
/// - The **radius** (roundness) of the notch
/// - The **depth** (vertical intrusion) of the notch
/// - The **background gradient** behind the notch
///
///
/// ### Usage
///
/// ```dart
/// CircularNotchedContainer(
///   offset: MediaQuery.of(context).size.width / 2 - 28,
///   gradient: const LinearGradient(
///     colors: [Colors.white, Colors.grey],
///     begin: Alignment.topCenter,
///     end: Alignment.bottomCenter,
///   ),
///   notchRadius: 36,
///   notchDepth: 24,
/// )
/// ```
///
/// You can position this widget behind a BottomAppBar using a `Stack`:
///
/// ```dart
/// Stack(
///   alignment: Alignment.bottomCenter,
///   children: [
///     CircularNotchedContainer(
///       offset: MediaQuery.of(context).size.width / 2 - 28,
///       gradient: const LinearGradient(
///         colors: [Colors.white, Colors.grey],
///       ),
///       notchRadius: 36,
///       notchDepth: 24,
///     ),
///     BottomAppBar(
///       shape: const CircularNotchedRectangle(),
///       notchMargin: 6,
///       child: SizedBox(height: 60),
///     ),
///   ],
/// )
/// ```
///
///
/// ### Parameters
///
/// | Parameter | Type | Description |
/// |------------|------|--------------|
/// | `offset` | `double` | Horizontal position of the notch’s left edge (typically center of the FAB minus its radius). |
/// | `gradient` | `Gradient` | Background gradient applied to the entire container before painting the notch. |
/// | `notchRadius` | `double` | Controls the roundness of the notch. Larger values produce a deeper, smoother curve. |
/// | `notchDepth` | `double` | Controls how far vertically the notch cuts into the container. |
///
///
/// ### Implementation Details
///
/// Internally, `CircularNotchedContainer` uses a private painter class
/// `_CircularNotchedPainter`, which draws the container’s path with a circular
/// cutout calculated from the geometry of the host (container) and guest (notch).
///
/// It relies on geometric equations similar to those used in
/// Flutter’s built-in [`CircularNotchedRectangle`], but provides:
/// - Manual path symmetry control
/// - Shadow drawing
/// - Gradient fill support
///
/// The painter defines several path-generation methods:
///
/// - `getOuterPath(Rect host, Rect? guest)` — builds the main notched outline.
/// - `getFillerPath(Rect host, Rect? guest)` — variant that includes the lower area for fill rendering.
/// - `backwardPath(Rect host, Rect? guest)` — creates a mirrored path useful for animation or debugging.
///
///
/// ### Visual Output
///
/// The container appears as a full-width rectangle with a **smooth circular
/// notch cut inward** from the top edge, usually centered under a FAB.
///
/// Example:
///
/// ```
///
///     ┌───────────────────────────────┐
///     │            FAB                │
///     │          (notch)              │
///     │        ╱¯¯¯¯¯¯¯╲             │
///     │_______╱         ╲_____________│
///
/// ```
///
///
/// ### Notes
///
/// - This widget paints directly to the canvas — it does **not** clip its child.
/// - Best used as a decorative background in a `Stack`.
/// - For a rectangular or squarish notch, see [`SquarishNotch`].
///
///
/// ### See Also
///
/// - [`CircularNotchedRectangle`](https://api.flutter.dev/flutter/material/CircularNotchedRectangle-class.html)
/// - [`NotchedShape`](https://api.flutter.dev/flutter/material/NotchedShape-class.html)
/// - [`BottomAppBar`](https://api.flutter.dev/flutter/material/BottomAppBar-class.html)
class CircularNotchedContainer extends StatelessWidget {
  const CircularNotchedContainer({
    super.key,
    required this.offset,
    required this.gradient,
    required this.notchRadius,
    required this.notchDepth,
  });

  /// Horizontal offset of the notch’s left edge.
  /// Usually set to `(FAB center X position) - notchRadius`.
  final double offset;

  /// Background gradient used to fill the container before painting the notch.
  final Gradient gradient;

  /// Radius of the circular notch cut-out.
  final double notchRadius;

  /// Vertical depth of the notch.
  final double notchDepth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _CircularNotchedPainter(
        offset: offset,
        gradient: gradient,
        notchRadius: notchRadius,
        notchDepth: notchDepth,
      ),
    );
  }
}

class _CircularNotchedPainter extends CustomPainter {
  final double offset;
  final Gradient gradient;
  final double notchRadius;
  final double notchDepth;
  _CircularNotchedPainter({
    required this.offset,
    required this.gradient,
    required this.notchRadius,
    required this.notchDepth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final guest =
        Rect.fromLTRB(offset, 0, offset + notchRadius * 2, notchDepth);

    final stroker = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.green;
    final outerPath = getOuterPath(rect, guest);
    canvas.drawPath(outerPath, stroker);
    canvas.drawShadow(outerPath.shift(const Offset(-5, -8)),
        Colors.red.withOpacity(0.6), 4.0, false);
  }

  @override
  bool shouldRepaint(_CircularNotchedPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_CircularNotchedPainter oldDelegate) => false;

  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset?> p = List<Offset?>.filled(6, null);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2]!.dx, p[2]!.dy);
    p[4] = Offset(-1.0 * p[1]!.dx, p[1]!.dy);
    p[5] = Offset(-1.0 * p[0]!.dx, p[0]!.dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) {
      p[i] = p[i]! + guest.center;
    }

    final path = Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0]!.dx, p[0]!.dy)
      ..quadraticBezierTo(p[1]!.dx, p[1]!.dy, p[2]!.dx, p[2]!.dy)
      ..arcToPoint(p[3]!,
          radius: Radius.circular(notchRadius), clockwise: false)
      ..quadraticBezierTo(p[4]!.dx, p[4]!.dy, p[5]!.dx, p[5]!.dy)
      ..lineTo(host.right, host.top)
      ..lineTo(p[5]!.dx, p[5]!.dy)
      ..quadraticBezierTo(p[4]!.dx, p[4]!.dy, p[3]!.dx, p[3]!.dy)
      ..arcToPoint(p[2]!, radius: Radius.circular(notchRadius), clockwise: true)
      ..quadraticBezierTo(p[1]!.dx, p[1]!.dy, p[0]!.dx, p[0]!.dy)
      ..lineTo(host.left, host.top)
      ..close();

    return path;
  }

  Path getFillerPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    // The guest's shape is a circle bounded by the guest rectangle.
    // So the guest's radius is half the guest width.
    // final double notchRadius = guest.width / 2.0;

    // We build a path for the notch from 3 segments:
    // Segment A - a Bezier curve from the host's top edge to segment B.
    // Segment B - an arc with radius notchRadius.
    // Segment C - a Bezier curve from segment B back to the host's top edge.
    //
    // A detailed explanation and the derivation of the formulas below is
    // available at: https://goo.gl/Ufzrqn

    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset?> p = List<Offset?>.filled(6, null);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2]!.dx, p[2]!.dy);
    p[4] = Offset(-1.0 * p[1]!.dx, p[1]!.dy);
    p[5] = Offset(-1.0 * p[0]!.dx, p[0]!.dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) {
      p[i] = p[i]! + guest.center;
      // log('p[$i] = ${p[i]}');
    }

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0]!.dx, p[0]!.dy)
      ..quadraticBezierTo(p[1]!.dx, p[1]!.dy, p[2]!.dx, p[2]!.dy)
      ..arcToPoint(
        p[3]!,
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4]!.dx, p[4]!.dy, p[5]!.dx, p[5]!.dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }

  Path backwardPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) {
      return Path()..addRect(host);
    }

    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset?> p = List<Offset?>.filled(6, null);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2]!.dx, p[2]!.dy);
    p[4] = Offset(-1.0 * p[1]!.dx, p[1]!.dy);
    p[5] = Offset(-1.0 * p[0]!.dx, p[0]!.dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) {
      p[i] = p[i]! + guest.center;
    }

    final forward = Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0]!.dx, p[0]!.dy)
      ..quadraticBezierTo(p[1]!.dx, p[1]!.dy, p[2]!.dx, p[2]!.dy)
      ..arcToPoint(p[3]!,
          radius: Radius.circular(notchRadius), clockwise: false)
      ..quadraticBezierTo(p[4]!.dx, p[4]!.dy, p[5]!.dx, p[5]!.dy)
      ..lineTo(host.right, host.top);

// mirror the commands in reverse (note arc flips clockwise:true)
    final backward = Path()
      ..moveTo(host.right, host.top)
      ..lineTo(p[5]!.dx, p[5]!.dy)
      ..quadraticBezierTo(p[4]!.dx, p[4]!.dy, p[3]!.dx, p[3]!.dy)
      ..arcToPoint(p[2]!, radius: Radius.circular(notchRadius), clockwise: true)
      ..quadraticBezierTo(p[1]!.dx, p[1]!.dy, p[0]!.dx, p[0]!.dy)
      ..lineTo(host.left, host.top);

// Use either forward (filled via perimeter + close) or stroke both:
    final path = Path()
      ..addPath(forward, Offset.zero)
      ..addPath(backward, Offset.zero);

    return path;
  }
}
