import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarwati/core/utils/screen_extensions.dart';
import 'package:tarwati/core/theming/colors.dart';

class AppTheme {
  AppTheme();

  String get fontFamily => 'IBM Plex Sans';

  TextStyle get defaultButtonTextStyle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 15.spMin,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  AppColors get colors => AppColors.light;
  AppColors get darkColors => AppColors.dark;

  ThemeData get lightTheme {
    return ThemeData(
      fontFamily: fontFamily,
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        secondary: colors.primary,
        error: colors.error,
      ),
      // Configure system UI overlay style for status bar
      appBarTheme: AppBarTheme(
        shadowColor: Colors.black54,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20.spMin,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.rm),
            topRight: Radius.circular(26.rm),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: defaultButtonTextStyle,
          foregroundColor: colors.primaryDarker,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          textStyle: defaultButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(textStyle: defaultButtonTextStyle),
      ),
      scaffoldBackgroundColor: Colors.white,
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 17.spMin,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 15.spMin,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(colors.primary),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 3,
        backgroundColor: colors.white,
        contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.spMin,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
        ),
        actionTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.rm),
          side: BorderSide(color: colors.grey300, width: 1),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.rm),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16.wm, vertical: 16.hm),
        shadowColor: Colors.black45,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20.spMin,
          fontWeight: FontWeight.w600,
          color: colors.textPrimary,
        ),
        contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.spMin,
          height: 1.4,
          color: colors.textPrimary,
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.black45,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return null;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        visualDensity: VisualDensity.comfortable,
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      dividerTheme: const DividerThemeData(thickness: 1, space: 0),
      menuButtonTheme: MenuButtonThemeData(
        style: MenuItemButton.styleFrom(backgroundColor: Colors.white),
      ),
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 45.spMin,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 34.spMin,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 24.spMin,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
          height: 1.6,
        ),
        titleMedium: TextStyle(
          fontSize: 19.spMin,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
          height: 1.4,
        ),
        titleSmall: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w500,
          color: colors.textPrimary,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          fontSize: 18.spMin,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: colors.textPrimary,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w400,
          color: colors.textSecondary,
          height: 1.4,
        ),
        labelMedium: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: colors.textSecondary,
          height: 1.4,
        ),
        labelSmall: TextStyle(
          fontSize: 12.spMin,
          fontWeight: FontWeight.w400,
          color: colors.textSecondary,
          height: 1.4,
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      fontFamily: fontFamily,
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkColors.primary,
        secondary: darkColors.primary,
        error: darkColors.error,
        brightness: Brightness.dark,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkColors.bg,
        surfaceTintColor: darkColors.bg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.rm),
            topRight: Radius.circular(26.rm),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: defaultButtonTextStyle,
          foregroundColor: darkColors.primaryDarker,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: darkColors.primary,
          textStyle: defaultButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(textStyle: defaultButtonTextStyle),
      ),
      scaffoldBackgroundColor: darkColors.bg,
      appBarTheme: AppBarTheme(
        shadowColor: Colors.black54,
        backgroundColor: darkColors.bg,
        surfaceTintColor: darkColors.bg,
        elevation: 0,
        scrolledUnderElevation: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkColors.bg,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20.spMin,
          fontWeight: FontWeight.w500,
          color: darkColors.textPrimary,
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 17.spMin,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 15.spMin,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(darkColors.primary),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 3,
        backgroundColor: darkColors.lightGray,
        contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.spMin,
          fontWeight: FontWeight.w400,
          color: darkColors.textPrimary,
        ),
        actionTextColor: darkColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.rm),
          side: BorderSide(color: darkColors.grey300, width: 1),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: darkColors.lightGray,
        surfaceTintColor: darkColors.lightGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.rm),
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16.wm, vertical: 16.hm),
        shadowColor: Colors.black45,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20.spMin,
          fontWeight: FontWeight.w600,
          color: darkColors.textPrimary,
        ),
        contentTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16.spMin,
          height: 1.4,
          color: darkColors.textPrimary,
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: darkColors.lightGray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: darkColors.lightGray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadowColor: Colors.black45,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return darkColors.primary;
          }
          return null;
        }),
        checkColor: WidgetStateProperty.all(darkColors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        visualDensity: VisualDensity.comfortable,
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      dividerTheme: const DividerThemeData(thickness: 1, space: 0),
      menuButtonTheme: MenuButtonThemeData(
        style: MenuItemButton.styleFrom(backgroundColor: darkColors.lightGray),
      ),
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: WidgetStateProperty.all(darkColors.lightGray),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 45.spMin,
          fontWeight: FontWeight.w500,
          color: darkColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 34.spMin,
          fontWeight: FontWeight.w500,
          color: darkColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 24.spMin,
          fontWeight: FontWeight.w500,
          color: darkColors.textPrimary,
          height: 1.6,
        ),
        titleMedium: TextStyle(
          fontSize: 19.spMin,
          fontWeight: FontWeight.w500,
          color: darkColors.textPrimary,
          height: 1.4,
        ),
        titleSmall: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w500,
          color: darkColors.textPrimary,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          fontSize: 18.spMin,
          fontWeight: FontWeight.w400,
          color: darkColors.textPrimary,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w400,
          color: darkColors.textPrimary,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: darkColors.textPrimary,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w400,
          color: darkColors.textSecondary,
          height: 1.4,
        ),
        labelMedium: TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w400,
          color: darkColors.textSecondary,
          height: 1.4,
        ),
        labelSmall: TextStyle(
          fontSize: 12.spMin,
          fontWeight: FontWeight.w400,
          color: darkColors.textSecondary,
          height: 1.4,
        ),
      ),
    );
  }
}
