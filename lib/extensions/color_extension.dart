//
import 'dart:developer' as developer;
import 'package:flutter/material.dart';

extension HexColorOnString on String {
  Color toColor() {
    try {
      var hexColor = toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      final hex = int.parse(hexColor, radix: 16);
      return Color(hex);
    } catch (e) {
      developer.log('$this is not valid hex number', name: 'HexColorOnString');
      return Colors.white;
    }
  }
}

extension HexColorOnColor on Color {
  String hex() => toARGB32().toRadixString(16);
}
