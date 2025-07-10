//

import 'package:flutter/material.dart';

const double kMobileMaxSize = 600;

const double kTabletMaxSize = 1200;

extension BuildContextDetails on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  double get navBarHeight => kToolbarHeight;
  Orientation get orientation => mediaQuery.orientation;
  TextDirection get directionality => Directionality.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom != 0.0;

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isMobile => mediaQuery.size.width < kMobileMaxSize;

  bool get isArabic => directionality == TextDirection.rtl;

  bool get isDarkMood => Theme.of(this).brightness == Brightness.dark;

  bool get isTablet =>
      mediaQuery.size.width >= kMobileMaxSize &&
      mediaQuery.size.width <= kTabletMaxSize;

  bool get isDesktop => mediaQuery.size.width > kTabletMaxSize;

  RouteSettings? get currentRoute => ModalRoute.of(this)?.settings;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(fontSize: 14);
  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(fontSize: 16);
  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(fontSize: 18);
}
