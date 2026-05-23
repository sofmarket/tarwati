import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarwati/gen/strings.g.dart';

abstract class Preferences {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    initLocale();
  }

  static void setIsOnboardingVisted(bool value) {
    _prefs.setBool('is_onboarding_visited', value);
  }

  static bool isOnboardingVisted() {
    return _prefs.getBool('is_onboarding_visited') ?? false;
  }

  static String? getLocale() {
    return _prefs.getString('locale');
  }

  static void setLocale(AppLocale locale) {
    LocaleSettings.setLocaleRaw(locale.languageCode);
    _prefs.setString('locale', locale.languageCode);
  }

  static void initLocale() {
    final locale = getLocale();
    LocaleSettings.setLocaleRaw(locale ?? 'en');
  }

  static bool isDarkMode() {
    return _prefs.getBool('is_dark_mode') ?? false;
  }

  static Future<void> setIsDarkMode(bool value) async {
    await _prefs.setBool('is_dark_mode', value);
  }
}
