//

import 'package:flutter/material.dart';

/// A custom [NotchedShape] that draws a *squarish inward notch*
/// for a centered [FloatingActionButton], while also allowing
/// rounded top corners for the entire [BottomAppBar].
///
/// This shape can be assigned to the `shape` property of a [BottomAppBar]
/// to produce a notch that appears as a rectangular cut-in with
/// slightly rounded corners.
///
/// Example:
/// ```dart
/// BottomAppBar(
///   shape: const SquarishNotch(
///     width: 100,
///     depth: 34,
///     topRadius: 16,
///     bottomRadius: 16,
///     barCornerRadius: 24,
///   ),
///   notchMargin: 6.0,
///   child: SizedBox(height: 60),
/// )
/// ```
///
/// ### Visual structure
///
/// ┌───────────────────────────────────────────┐
/// │   ◜───────────────╱╲───────────────◝     │
/// │   │               FAB               │     │
/// │   │                                 │     │
/// └───────────────────────────────────────────┘
///
/// * The notch “cuts into” the top of the bar.
/// * The notch width and depth can be customized.
/// * The notch’s inner corners can have their own radii.
/// * The bar’s outer top corners can also be rounded independently.
///
///
/// ### Parameters:
/// - [width] — total horizontal width of the notch.
/// - [depth] — vertical distance the notch cuts into the bar.
/// - [topRadius] — rounding radius for the upper corners of the notch.
/// - [bottomRadius] — rounding radius for the lower corners of the notch.
/// - [barCornerRadius] — rounding radius for the top-left and top-right
///   corners of the overall bar.
///
///
/// ### Notes:
/// * The shape adapts automatically if no [guest] (i.e., FAB) overlaps.
/// * The resulting path remains continuous for proper elevation shadows.
/// * Designed to mimic a “cut-in slot” rather than a circular notch.
///
///
/// Author: *saleem.saleem*
/// Version: 1.0
class SquarishNotch extends NotchedShape {
  /// The horizontal width of the notch.
  ///
  /// This determines how wide the notch cut appears under the FAB.
  final double width;

  /// The vertical depth of the notch, measured from the top edge
  /// of the [BottomAppBar] down to the deepest point of the cut.
  final double depth;

  /// The rounding radius for the upper corners of the notch.
  ///
  /// Larger values make the notch corners softer and more organic.
  final double topRadius;

  /// The rounding radius for the lower corners of the notch.
  ///
  /// Controls the curvature at the base of the notch cut-in.
  final double bottomRadius;

  /// The rounding radius for the top-left and top-right corners
  /// of the entire [BottomAppBar].
  ///
  /// This defines how rounded the bar itself appears.
  final double barCornerRadius;

  /// Creates a new [SquarishNotch] with customizable dimensions and curvature.
  ///
  /// All parameters are optional and have visually balanced defaults.
  const SquarishNotch({
    this.width = 80.0,
    this.depth = 14.0,
    this.topRadius = 8.0,
    this.bottomRadius = 6.0,
    this.barCornerRadius = 20.0,
  });

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    // If no FAB overlaps, draw a simple rounded rectangle for the bar.
    if (guest == null || !host.overlaps(guest)) {
      return Path()
        ..addRRect(RRect.fromRectAndCorners(
          host,
          topLeft: Radius.circular(barCornerRadius),
          topRight: Radius.circular(barCornerRadius),
        ));
    }

    // Notch geometry
    final notchLeft = guest.center.dx - width / 2;
    final notchRight = guest.center.dx + width / 2;
    final notchBottom = host.top + depth;

    final rTop = topRadius.clamp(0.0, depth / 2);
    final rBottom = bottomRadius.clamp(0.0, depth / 2);
    final barR = barCornerRadius.clamp(0.0, host.height / 2);

    final path = Path()
      // ┌ Top-left rounded corner of the bar
      ..moveTo(host.left, host.top + barR)
      ..quadraticBezierTo(host.left, host.top, host.left + barR, host.top)

      // ─ Line from left bar corner to start of notch
      ..lineTo(notchLeft, host.top)

      // ◜ Outward top-left curve of notch
      ..quadraticBezierTo(
          notchLeft + rTop, host.top, notchLeft + rTop, host.top + rTop)

      // │ Left vertical side of notch
      ..lineTo(notchLeft + rTop, notchBottom - rBottom)

      // ◝ Bottom-left curve of notch
      ..quadraticBezierTo(notchLeft + rTop, notchBottom,
          notchLeft + rTop + rBottom, notchBottom)

      // ─ Bottom of notch
      ..lineTo(notchRight - rTop - rBottom, notchBottom)

      // ◜ Bottom-right curve of notch
      ..quadraticBezierTo(notchRight - rTop, notchBottom, notchRight - rTop,
          notchBottom - rBottom)

      // │ Right vertical side of notch
      ..lineTo(notchRight - rTop, host.top + rTop)

      // ◝ Outward top-right curve of notch
      ..quadraticBezierTo(notchRight - rTop, host.top, notchRight, host.top)

      // ─ Continue to top-right corner of bar
      ..lineTo(host.right - barR, host.top)
      ..quadraticBezierTo(host.right, host.top, host.right, host.top + barR)

      // │ Draw rest of bar rectangle
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();

    return path;
  }
}
