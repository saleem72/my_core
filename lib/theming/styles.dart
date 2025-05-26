//

import 'package:my_core/theming/styled.dart';
import 'package:flutter/material.dart';
import 'package:my_core/theming/pallet.dart';

import 'font_styles.dart';
import 'sizes.dart';

class DarkStyles {
  DarkStyles._internal();

  static final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Pallet.primary.shade800,
    primary: Pallet.primary.shade800,
    secondary: Pallet.secondary,
    tertiary: Pallet.tertiary,
    background: Pallet.neutral.shade800,
  );

  static final ProgressIndicatorThemeData progressIndicatorTheme =
      ProgressIndicatorThemeData(
    color: Pallet.primary.shade800,
  );

  static ElevatedButtonThemeData elevatedButtonTheme(String fontFamily) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 0,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          textStyle: FontStyles.elevatedButtonTextStyle(fontFamily).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: FontSizes.small,
            fontFamily: 'Product Sans',
          ),
        ),
      );

  static TextTheme textTheme() {
    final greyText = Pallet.secondary.shade200;
    final coloredText = Pallet.primary.shade500;
    return TextTheme(
        headlineLarge: FontStyles.headlineLarge,
        headlineMedium: FontStyles.headlineMedium,
        labelLarge: FontStyles.labelLarge.copyWith(
          color: greyText,
        ),
        labelMedium: FontStyles.labelMedium,
        titleLarge: FontStyles.labelLarge.copyWith(
          color: coloredText,
        ),
        displayMedium: FontStyles.labelMedium.copyWith(
          color: greyText,
        ),
        bodyLarge: FontStyles.bodyLarge.copyWith(
          color: greyText,
        ));
  }

  static final appBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Pallet.primary.shade500,
  );

  static final DrawerThemeData drawerTheme = DrawerThemeData(
    backgroundColor: Pallet.primary.shade800,
    surfaceTintColor: Colors.black,
  );

  static final IconThemeData iconTheme = IconThemeData(
    size: IconSizes.medium,
    color: Pallet.primary.shade800,
  );

  static SnackBarThemeData snackBarTheme = SnackBarThemeData(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(RadiusSizes.medium),
        topRight: Radius.circular(RadiusSizes.medium),
      ),
    ),
    backgroundColor: Pallet.primary.shade800,
    actionTextColor: Colors.black,
    closeIconColor: Colors.black,
    insetPadding: const EdgeInsets.all(PaddingSizes.xSmall),
    contentTextStyle: FontStyles.labelMedium.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  static final bottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: Pallet.secondary.shade700,
    selectedItemColor: Pallet.primary.shade500,
    unselectedItemColor: Pallet.secondary.shade100,
  );

  static const cardTheme = CardTheme(
    color: Pallet.secondary,
    shadowColor: Colors.white24,
  );
}

class LightStyles {
  LightStyles._internal();

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Pallet.primary.shade500,
    primary: Pallet.primary.shade500,
    secondary: Pallet.secondary,
    tertiary: Pallet.tertiary,
    background: Pallet.neutral.shade50,
  );

  static TextTheme textTheme() {
    final greyText = Pallet.secondary.shade300;
    final coloredText = Pallet.primary.shade800;
    return TextTheme(
        headlineLarge: FontStyles.headlineLarge,
        headlineMedium: FontStyles.headlineMedium,
        labelLarge: FontStyles.labelLarge.copyWith(
          color: greyText,
        ),
        labelMedium: FontStyles.labelMedium,
        titleLarge: FontStyles.labelLarge.copyWith(
          color: coloredText,
        ),
        displayMedium: FontStyles.labelMedium.copyWith(
          color: greyText,
        ),
        bodyLarge: FontStyles.bodyLarge.copyWith(
          color: greyText,
        ));
  }

  static final appBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    // iconTheme: IconThemeData(
    //   color: Pallet.primary.shade800,
    // ),
    foregroundColor: Pallet.primary.shade800,
  );

  static final ProgressIndicatorThemeData progressIndicatorTheme =
      ProgressIndicatorThemeData(
    color: Pallet.primary.shade500,
  );

  static elevatedButtonTheme(String fontFamily) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 0,
          foregroundColor: Colors.white,
          padding: StylesEdgeInsets.mediumSymmetricHorizontal,
          shadowColor: Colors.transparent,
          textStyle: FontStyles.elevatedButtonTextStyle(fontFamily).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: FontSizes.small,
            fontFamily: 'Product Sans',
          ),
        ),
      );

  static const drawerTheme = DrawerThemeData(
    backgroundColor: Pallet.secondary,
    surfaceTintColor: Colors.white,
  );

  static final iconTheme = IconThemeData(
    size: IconSizes.medium,
    color: Pallet.primary.shade800,
  );

  static final snackBarTheme = SnackBarThemeData(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(RadiusSizes.medium),
      topRight: Radius.circular(RadiusSizes.medium),
    )),
    backgroundColor: Pallet.primary.shade300,
    actionTextColor: Colors.white,
    closeIconColor: Colors.white,
    insetPadding: const EdgeInsets.all(PaddingSizes.xSmall),
    contentTextStyle: FontStyles.labelMedium.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}
