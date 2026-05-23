import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarwati/core/theming/theme.dart';
import 'package:tarwati/core/utils/preferences.dart';
import 'package:flutter_riverpod/legacy.dart';

class ThemeState {
  final bool isDarkMode;
  final ThemeData theme;

  const ThemeState({required this.isDarkMode, required this.theme});

  ThemeState copyWith({bool? isDarkMode, ThemeData? theme}) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      theme: theme ?? this.theme,
    );
  }
}

class ThemeNotifier extends StateNotifier<ThemeState> {
  final AppTheme _appTheme;

  ThemeNotifier(this._appTheme)
    : super(ThemeState(isDarkMode: false, theme: _appTheme.lightTheme));

  /// Initialize theme from preferences
  Future<void> initializeTheme() async {
    final isDarkMode = Preferences.isDarkMode();
    final theme = isDarkMode ? _appTheme.darkTheme : _appTheme.lightTheme;
    state = ThemeState(isDarkMode: isDarkMode, theme: theme);
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    final newIsDarkMode = !state.isDarkMode;
    final newTheme = newIsDarkMode ? _appTheme.darkTheme : _appTheme.lightTheme;

    // Save preference
    await Preferences.setIsDarkMode(newIsDarkMode);

    // Update state
    state = ThemeState(isDarkMode: newIsDarkMode, theme: newTheme);
  }

  /// Set specific theme mode
  Future<void> setThemeMode(bool isDarkMode) async {
    if (state.isDarkMode == isDarkMode) return;

    final newTheme = isDarkMode ? _appTheme.darkTheme : _appTheme.lightTheme;

    // Save preference
    await Preferences.setIsDarkMode(isDarkMode);

    // Update state
    state = ThemeState(isDarkMode: isDarkMode, theme: newTheme);
  }
}

// Provider for AppTheme
final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

// Main theme provider
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier(ref.read(appThemeProvider));
});

// Computed providers for specific state access
final isDarkModeProvider = Provider<bool>((ref) {
  return ref.watch(themeProvider).isDarkMode;
});

final currentThemeProvider = Provider<ThemeData>((ref) {
  return ref.watch(themeProvider).theme;
});
