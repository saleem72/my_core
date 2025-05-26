//

import 'package:flutter/material.dart';

class Pallet {
  Pallet._internal();
  static const Color lightText = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF000000);

  static const MaterialColor primary = MaterialColor(
    0xFF30FF51,
    {
      50: Color(0xFFEAFFEE),
      100: Color(0xFFBFFFC9),
      200: Color(0xFFA0FFAF),
      300: Color(0xFF74FF8A),
      400: Color(0xFF59FF74),
      500: Color(0xFF30FF51),
      600: Color(0xFF2CE84A),
      700: Color(0xFF22B53A),
      800: Color(0xFF098E1F),
      900: Color(0xFF066516),
    },
  );

  static const MaterialColor secondary = MaterialColor(
    0xFF4A4A4A,
    {
      50: Color(0xFFEDEDED),
      100: Color(0xFFC7C7C7),
      200: Color(0xFFACACAC),
      300: Color(0xFF868686),
      400: Color(0xFF6E6E6E),
      500: Color(0xFF4A4A4A),
      600: Color(0xFF434343),
      700: Color(0xFF353535),
      800: Color(0xFF292929),
      900: Color(0xFF1F1F1F),
    },
  );

  static const MaterialColor tertiary = MaterialColor(
    0xFF512EFF,
    {
      50: Color(0xFFEEEAFF),
      100: Color(0xFFC9BEFF),
      200: Color(0xFFAF9FFF),
      300: Color(0xFF8A73FF),
      400: Color(0xFF7458FF),
      500: Color(0xFF512EFF),
      600: Color(0xFF4A2AE8),
      700: Color(0xFF3A21B5),
      800: Color(0xFF2D198C),
      900: Color(0xFF22136B),
    },
  );

  static const MaterialColor error = MaterialColor(
    0xFFfc7171,
    {
      50: Color(0xFFfff1f1),
      100: Color(0xFFfed3d3),
      200: Color(0xFFfebebe),
      300: Color(0xFFfda0a0),
      400: Color(0xFFfd8d8d),
      500: Color(0xFFfc7171),
      600: Color(0xFFe56767),
      700: Color(0xFFb35050),
      800: Color(0xFF8b3e3e),
      900: Color(0xFF6a2f2f),
    },
  );

  static const MaterialColor neutralVariant = MaterialColor(
    0xFFADADAD,
    {
      50: Color(0xFFF7F7F7),
      100: Color(0xFFE6E6E6),
      200: Color(0xFFD9D9D9),
      300: Color(0xFFC8C8C8),
      400: Color(0xFFBDBDBD),
      500: Color(0xFFADADAD),
      600: Color(0xFF9D9D9D),
      700: Color(0xFF7B7B7B),
      800: Color(0xFF5F5F5F),
      900: Color(0xFF494949),
    },
  );

  static const MaterialColor neutral = MaterialColor(
    0xFF222222,
    {
      50: Color(0xFFE9E9E9),
      100: Color(0xFFBABABA),
      200: Color(0xFF999999),
      300: Color(0xFF6B6B6B),
      400: Color(0xFF4E4E4E),
      500: Color(0xFF222222),
      600: Color(0xFF1F1F1F),
      700: Color(0xFF181818),
      800: Color(0xFF131313),
      900: Color(0xFF0E0E0E),
    },
  );
}
