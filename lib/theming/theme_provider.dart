//

import 'package:flutter/material.dart';

class Pallet {
  Pallet._internal();

  static const MaterialColor primary = MaterialColor(
    0xFF88572C,
    {
      50: Color(0xFFFFE8C9),
      100: Color(0xFFEFC9AA),
      200: Color(0xFFD3A888),
      300: Color(0xFFB58863),
      400: Color(0xFF9F6F47),
      500: Color(0xFF88572C),
      600: Color(0xFF7C4D26),
      700: Color(0xFF6D411D),
      800: Color(0xFF5F3316),
      900: Color(0xFF50250D),
    },
  );

  static const MaterialColor secondary = MaterialColor(
    0xFF6E9DC1,
    {
      50: Color(0xFFE8F3F7),
      100: Color(0xFFC6E0EC),
      200: Color(0xFFA8CDE0),
      300: Color(0xFF8DB9D2),
      400: Color(0xFF7CABC9),
      500: Color(0xFF6E9DC1),
      600: Color(0xFF6390B5),
      700: Color(0xFF577FA3),
      800: Color(0xFF4E6E91),
      900: Color(0xFF3E5270),
    },
  );

  static const MaterialColor tertiary = MaterialColor(
    0xFF4EA948,
    {
      50: Color(0xFFE8F4E8),
      100: Color(0xFFC8E4C6),
      200: Color(0xFFA5D3A3),
      300: Color(0xFF81C37E),
      400: Color(0xFF67B663),
      500: Color(0xFF4EA948),
      600: Color(0xFF459B3F),
      700: Color(0xFF3A8935),
      800: Color(0xFF2F782B),
      900: Color(0xFF1C591A),
    },
  );

  static const MaterialColor error = MaterialColor(
    0xFFBA2D2F,
    {
      50: Color(0xFFF5E7EA),
      100: Color(0xFFE9C4CA),
      200: Color(0xFFCB8C90),
      300: Color(0xFFB56367),
      400: Color(0xFFB94448),
      500: Color(0xFFBA2D2F),
      600: Color(0xFFAD262E),
      700: Color(0xFF9C1D28),
      800: Color(0xFF901621),
      900: Color(0xFF820817),
    },
  );

  static const MaterialColor neutralVariant = MaterialColor(
    0xFF908E92,
    {
      50: Color(0xFFFAF7FC),
      100: Color(0xFFF2EEF4),
      200: Color(0xFFE7E4E9),
      300: Color(0xFFD6D2D8),
      400: Color(0xFFB1AEB3),
      500: Color(0xFF908E92),
      600: Color(0xFF69666A),
      700: Color(0xFF555357),
      800: Color(0xFF373539),
      900: Color(0xFF171519),
    },
  );

  static const MaterialColor neutral = MaterialColor(
    0xFF979797,
    {
      50: Color(0xFFF9F9F9),
      100: Color(0xFFF3F3F3),
      200: Color(0xFFEAEAEA),
      300: Color(0xFFDADADA),
      400: Color(0xFFB7B7B7),
      500: Color(0xFF979797),
      600: Color(0xFF6E6E6E),
      700: Color(0xFF5B5B5B),
      800: Color(0xFF3C3C3C),
      900: Color(0xFF1C1C1C),
    },
  );
}

class ColorSchemeProvider {
  static const ColorScheme darkFromCorePalette = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF90C44B),
    onPrimary: Color(0xFFF2F8E9),
    primaryContainer: Color(0xFFB2D682),
    onPrimaryContainer: Color(0xFFF2F8E9),
    inversePrimary: Color(0xff6da039),
    secondary: Color(0xFF919F87),
    onSecondary: Color(0xffeffee4),
    secondaryContainer: Color(0xffd3e2c8),
    onSecondaryContainer: Color(0xffeffee4),
    tertiary: Color(0xFF4EBACC),
    onTertiary: Color(0xFFE2F7F9),
    tertiaryContainer: Color(0xFF67CEDC),
    onTertiaryContainer: Color(0xFFE2F7F9),
    error: Color(0xfff64234),
    onError: Color(0xFFFFEBEE),
    errorContainer: Color(0xFFE77372),
    onErrorContainer: Color(0xFFFFEBEE),
    background: Color(0xFF1C1C1C),
    onBackground: Color(0xFFF9F9F9),
    surface: Color(0xFF1C1C1C),
    onSurface: Color(0xFFF9F9F9),
    surfaceVariant: Color(0xFF979797),
    onSurfaceVariant: Color(0xFF1C1C1C),
    outline: Color(0xFF979797),
    outlineVariant: Color(0xFF979797),
    shadow: Color(0xFF1C1C1C),
    scrim: Color(0xFF1C1C1C),
    inverseSurface: Color(0xFFB7B7B7),
  );

  static const ColorScheme lightFromCorePalette = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFB58863),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD3A888),
    onPrimaryContainer: Color(0xFFFFFFFF),
    inversePrimary: Color(0xff6d411d),
    secondary: Color(0xFF6390B5),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xff8db9d2),
    onSecondaryContainer: Color(0xffffffff),
    tertiary: Color(0xFF67B663),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF81C37E),
    onTertiaryContainer: Color(0xFFFFFFFF),
    error: Color(0xffba2d2f),
    onError: Color(0xFFF5E7EA),
    errorContainer: Color(0xFFB56367),
    onErrorContainer: Color(0xFFF5E7EA),
    background: Color(0xFFF9F9F9),
    onBackground: Color(0xFF000000),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
    surfaceVariant: Color(0xFFF3F3F3),
    onSurfaceVariant: Color(0xFF000000),
    outline: Color(0xFF555357),
    outlineVariant: Color(0xFF908E92),
    shadow: Color(0xFF171519),
    scrim: Color(0xFF171519),
    inverseSurface: Color(0xFF6E6E6E),
  );
}

class ThemeProvider {
  ThemeProvider._internal();
  static ThemeData lightTheme() {
    const colorScheme = ColorSchemeProvider.lightFromCorePalette;
    final textTheme = ThemeData(brightness: Brightness.light).textTheme;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: const Color(0xFFF7F9F4),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF90C44B),
        foregroundColor: Color(0xFFF2F8E9),
      ),
    );
  }

  static ThemeData darkTheme() {
    const colorScheme = ColorSchemeProvider.darkFromCorePalette;
    final textTheme = ThemeData(brightness: Brightness.dark).textTheme;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: const Color(0xFF5B5B5B),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF90C44B),
        foregroundColor: Color(0xFFF2F8E9),
      ),
    );
  }
}
