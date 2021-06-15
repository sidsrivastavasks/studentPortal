import 'package:flutter/painting.dart';
import 'constant.dart';

/// Convenience class to access application colors.
abstract class AppColors {
  /// Dark background color.
  static const Color backgroundColor = Color(0xFF191D1F);

  /// Slightly lighter version of [backgroundColor].
  static const Color backgroundFadedColor = Color(0xFF191B1C);

  /// Color used for cards and surfaces.
  static final Color cardColor = hexToColor("#861c03");

  /// Accent color used in the application.
  static const Color accentColor = Color(0xFFef8354);
}
