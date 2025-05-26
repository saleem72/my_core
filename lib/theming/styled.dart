import 'package:my_core/theming/sizes.dart';
import 'package:flutter/material.dart';

class StylesEdgeInsets {
  StylesEdgeInsets._internal();

  /// symmetric horizontal 4
  static const EdgeInsets xSmallSymmetricHorizontal = EdgeInsets.symmetric(
    horizontal: PaddingSizes.xSmall,
  );

  /// symmetric horizontal 8
  static const EdgeInsets smallSymmetricHorizontal = EdgeInsets.symmetric(
    horizontal: PaddingSizes.small,
  );

  /// symmetric horizontal 16
  static const EdgeInsets mediumSymmetricHorizontal = EdgeInsets.symmetric(
    horizontal: PaddingSizes.medium,
  );

  /// symmetric horizontal 32
  static const EdgeInsets largeSymmetricHorizontal = EdgeInsets.symmetric(
    horizontal: PaddingSizes.large,
  );

  /// symmetric horizontal 64
  static const EdgeInsets xLargeSymmetricHorizontal = EdgeInsets.symmetric(
    horizontal: PaddingSizes.xLarge,
  );

  /// symmetric horizontal 128
  static const EdgeInsets xxLargeSymmetricHorizontal = EdgeInsets.symmetric(
    horizontal: PaddingSizes.xxLarge,
  );

  /// symmetric horizontal 4
  static const EdgeInsets xSmallSymmetricVertical = EdgeInsets.symmetric(
    vertical: PaddingSizes.xSmall,
  );

  /// symmetric vertical 8
  static const EdgeInsets smallSymmetricVertical = EdgeInsets.symmetric(
    vertical: PaddingSizes.small,
  );

  /// symmetric vertical 16
  static const EdgeInsets mediumSymmetricVertical = EdgeInsets.symmetric(
    vertical: PaddingSizes.medium,
  );

  /// symmetric vertical 32
  static const EdgeInsets largeSymmetricVertical = EdgeInsets.symmetric(
    vertical: PaddingSizes.large,
  );

  /// symmetric vertical 64
  static const EdgeInsets xLargeSymmetricVertical = EdgeInsets.symmetric(
    vertical: PaddingSizes.xLarge,
  );

  /// symmetric vertical 128
  static const EdgeInsets xxLargeSymmetricVertical = EdgeInsets.symmetric(
    vertical: PaddingSizes.xxLarge,
  );
}

class StylesVGap {
  StylesVGap._internal();

  /// = 4
  static const SizedBox xxSmall = SizedBox(height: GapSizes.xxSmall);

  /// = 8
  static const SizedBox xSmall = SizedBox(height: GapSizes.xSmall);

  /// = 16
  static const SizedBox medium = SizedBox(height: GapSizes.medium);

  /// = 24
  static const SizedBox large = SizedBox(height: GapSizes.large);

  /// = 32
  static const SizedBox xLarge = SizedBox(height: GapSizes.xLarge);

  /// = 40
  static const SizedBox xxLarge = SizedBox(height: GapSizes.xxLarge);

  /// = 64
  static const SizedBox xxxLarge = SizedBox(height: GapSizes.xxxLarge);
}

class StylesHGap {
  StylesHGap._internal();

  /// = 4
  static const SizedBox xxSmall = SizedBox(width: GapSizes.xxSmall);

  /// = 8
  static const SizedBox xSmall = SizedBox(width: GapSizes.xSmall);

  /// = 16
  static const SizedBox medium = SizedBox(width: GapSizes.medium);

  /// = 24
  static const SizedBox large = SizedBox(width: GapSizes.large);

  /// = 32
  static const SizedBox xLarge = SizedBox(width: GapSizes.xLarge);

  /// = 40
  static const SizedBox xxLarge = SizedBox(width: GapSizes.xxLarge);

  /// = 64
  static const SizedBox xxxLarge = SizedBox(width: GapSizes.xxxLarge);
}

class StyledBorderRadius {
  StyledBorderRadius._internal();

  /// = 6
  static final BorderRadius xSmall = BorderRadius.circular(RadiusSizes.xSmall);

  /// = 8
  static final BorderRadius small = BorderRadius.circular(RadiusSizes.small);

  /// = 12
  static final BorderRadius medium = BorderRadius.circular(RadiusSizes.medium);

  /// = 16
  static final BorderRadius large = BorderRadius.circular(RadiusSizes.large);

  /// = 24
  static final BorderRadius xLarge = BorderRadius.circular(RadiusSizes.xLarge);
}
