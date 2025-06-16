//

import 'package:flutter/material.dart';
import 'package:my_core/theming/pallet.dart';

import '../theming/core_colors.dart';

extension TextStyleProperties on TextStyle {
  TextStyle get primary => copyWith(color: Pallet.primary);
  TextStyle get gray => copyWith(color: CoreColors.greyText);

  TextStyle size(double size) => copyWith(fontSize: size);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}
