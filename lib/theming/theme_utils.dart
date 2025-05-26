//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pallet.dart';

class ThemeUtils {
  static void setStatusBarAndNavigationBarColor(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
      // themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
      systemNavigationBarIconBrightness: brightness,
      // themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: brightness == Brightness.light
          ? Pallet.neutral.shade700
          : Pallet.neutral.shade300,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
