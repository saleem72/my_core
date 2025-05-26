//

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:my_core/theming/app_colors.dart';

class TextThemeProvider {
  static TextTheme generate(Brightness brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return GoogleFonts.poppinsTextTheme(baseTheme.textTheme);
    // .copyWith(
    //   titleSmall: GoogleFonts.poppins().copyWith(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 16,
    //     color: AppColors.darkText,
    //   ),
    // );
  }
}
