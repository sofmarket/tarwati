import 'package:flutter/material.dart';

extension ColorExt on ColorScheme {
  bool get isLight => brightness == Brightness.light;
  bool get isDark => brightness == Brightness.dark;
}

class AppColors {
  const AppColors({
    required this.primaryDarkest,
    required this.primaryDarker,
    required this.primary,
    required this.primaryLight,
    required this.secondary,
    required this.secondaryDarker,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.stroke,
    required this.bg,
    required this.error,
    required this.success,
    required this.successDarker,
    required this.lightGray,
  });

  static const light = AppColors(
    primaryDarkest: Color(0xff1A1A6E),
    primaryDarker: Color(0xff2E2E9A),
    primary: Color(0xFF563cec),
    primaryLight: Color(0xff727bfd),
    secondary: Color(0xFF130950),
    // secondary: Color(0xFFad2184),
    secondaryDarker: Color(0xFF130950),
    textPrimary: Color.fromARGB(255, 0, 0, 0),
    textSecondary: Color(0xFF656565),
    textTertiary: Color(0xFF929090),
    stroke: Color(0x1E000000),
    bg: Color(0xFFF4F4F4),
    error: Color(0xffCA1616),
    success: Color(0xff62DA4F),
    successDarker: Color(0xff449C47),
    lightGray: Color(0XFFF8F8F8),
  );

  static const dark = AppColors(
    primaryDarkest: Color(0xff4A6FA5),
    primaryDarker: Color(0xff5A8BC8),
    primary: Color(0xff8B9CF0),
    primaryLight: Color(0xffA5B3F5),
    secondary: Color.fromARGB(255, 39, 39, 39),
    secondaryDarker: Color(0xff3BB5A3),
    textPrimary: Color(0xFFE8E8E8),
    textSecondary: Color(0xFFB0B0B0),
    textTertiary: Color(0xFF8A8A8A),
    stroke: Color(0x1EFFFFFF),
    bg: Color(0xFF1A1A1A),
    error: Color(0xffFF6B6B),
    success: Color(0xff7ED321),
    successDarker: Color(0xff5BA817),
    lightGray: Color(0xFF2A2A2A),
  );

  final Color primaryDarkest;
  final Color primaryDarker;
  final Color primary;
  final Color primaryLight;
  final Color secondary;
  final Color secondaryDarker;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color stroke;
  final Color bg;
  final Color error;
  final Color success;
  final Color successDarker;
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color lightGray;

  // grey shades
  Color get grey50 => Colors.grey.shade50;
  Color get grey100 => Colors.grey.shade100;
  Color get grey150 => const Color(0xFFF0F0F0);
  Color get grey200 => Colors.grey.shade200;
  Color get grey250 => const Color(0xFFE6E6E6);
  Color get grey300 => Colors.grey.shade300;
  Color get grey400 => Colors.grey.shade400;
  Color get grey500 => Colors.grey.shade500;
  Color get grey600 => Colors.grey.shade600;
  Color get grey700 => Colors.grey.shade700;
  Color get grey800 => Colors.grey.shade800;
  Color get grey900 => Colors.grey.shade900;

  // other
  Color get warning => Color(0xFFFF9800);
  Color get transparent => Colors.transparent;
  Color get yellow => const Color(0xFFFCC72C);
  Color get yellowDarker => const Color(0xFFE1BA2D);

  LinearGradient get gradient =>
      const LinearGradient(colors: [Color(0xFF1B5E20), Color(0xff408E44)]);
  LinearGradient get gradientSecondary =>
      const LinearGradient(colors: [Color(0xFF073651), Color.fromARGB(255, 17, 84, 123)]);
  LinearGradient get gradient2 =>
      const LinearGradient(colors: [Color(0xff2E8FF9), Color(0xff30DECD)]);
  LinearGradient get gradient3 => const LinearGradient(
    colors: [
      Color.fromARGB(255, 147, 149, 212),
      Color.fromARGB(255, 107, 110, 197),
    ],
    begin: AlignmentDirectional.bottomEnd,
    end: AlignmentDirectional.topStart,
  );
}
