import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

abstract class DeviceUtils {
  static Future<String?> getDeviceName() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isIOS) {
        var iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.name;
      } else if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        return androidDeviceInfo.device;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  static Future<String?> getFcmToken() async {
    // get fcm token from FCM 
    return null;
  }

  static Future<String?> getAppVersion() async {
    await Future.delayed(const Duration(seconds: 1));
    return "1.0.0"; // TODO: get app version from package info
  }

  static String checkPlatform() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "ios";
    } else if (Platform.isWindows) {
      return "windows";
    } else if (Platform.isMacOS) {
      return "macos";
    } else if (Platform.isLinux) {
      return "linux";
    }
    return "unknown";
  }
}
