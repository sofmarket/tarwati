import 'dart:math';

import 'package:tarwati/core/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

extension NavigationExtension on BuildContext {
  /// Pushes a new route onto the navigator stack
  Future<T?> push<T>(Widget page) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  /// Replaces the current route with a new route
  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  /// Pushes a new route and removes all previous routes until the predicate returns true
  Future<T?> pushAndRemoveUntil<T>(
    Widget page,
    bool Function(Route<dynamic>) predicate,
  ) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => page),
      predicate,
    );
  }

  /// Pops the top-most route off the navigator stack
  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }
}

extension FunctionExt<T> on void Function() {
  void Function() get withVibration {
    return () {
      HapticFeedback.lightImpact();
      this();
    };
  }
}

extension ObjectToListExt<T> on T {
  // an object to list of the object itself with length 3
  List<T> makeList([int length = 3]) {
    return List<T>.filled(length, this);
  }
}

// text extensions
extension StringExt on String {
  String mask() {
    return '*' * length;
  }

  String maskPartially() {
    return '*' * (length - 4) + substring(length - 4);
  }

  String get hard => this;

  String? get nullIfEmpty => isEmpty ? null : this;

  String get add966IfNotAdded {
    if (startsWith('966')) {
      return this;
    } else {
      return '966$this';
    }
  }

  String get remove966IfAdded {
    if (startsWith('966') && length == 12) {
      return replaceFirst('966', '');
    } else {
      return this;
    }
  }

  String formatDate() {
    final locale = Preferences.getLocale() ?? 'ar';
    try {
      final dt = DateTime.parse(this);
      return DateFormat('MMM dd, yyyy', locale).format(dt);
    } catch (_) {
      return this;
    }
  }
}

// go router
extension GoRouterExt on GoRouter {
  void safePop<T extends Object?>([T? result]) {
    if (canPop()) pop(result);
  }

  void popUntilLast() {
    while (canPop()) {
      pop();
    }
  }

  void popCallAndPushNamed(
    String routeName, {
    Map<String, dynamic> queryParams = const {},
    Object? extra,
    Map<String, String> pathParameters = const <String, String>{},
  }) {
    // Get the current location
    final location = routerDelegate.currentConfiguration.last.matchedLocation;

    // Check if we're on a call page
    if (location.endsWith('/call')) {
      // Pop the call page
      safePop();
    }

    // Push the named route
    pushNamed(
      routeName,
      queryParameters: queryParams,
      extra: extra,
      pathParameters: pathParameters,
    );
  }
}

extension DoubleExt on double {
  String formatNumber() {
    // Convert to string with a maximum of 2 decimal places
    String result = toStringAsFixed(2);

    // Remove trailing zeros after the decimal point
    result = result.replaceAll(RegExp(r'\.?0+$'), '');

    return result;
  }

  String formatCurrency() {
    return NumberFormat.currency(
      locale: Preferences.getLocale() ?? 'ar',
      symbol: 'MAD', // get currency from translations
      decimalDigits: 0,
    ).format(this);
  }
}

extension DateExt on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isToday() {
    return isSameDay(DateTime.now());
  }

  bool isYesterday() {
    return isSameDay(DateTime.now().subtract(const Duration(days: 1)));
  }

  bool isTomorrow() {
    return isSameDay(DateTime.now().add(const Duration(days: 1)));
  }

  bool isBeforeYesterday() {
    return isSameDay(DateTime.now().subtract(const Duration(days: 2)));
  }

  String format() {
    final locale = Preferences.getLocale() ?? 'ar';
    try {
      return DateFormat('MMM dd, yyyy', locale).format(this);
    } catch (_) {
      return toString();
    }
  }
}

// colors
extension ColorsExt on Color {
  Color makeColorLighter({double factor = 0.2}) {
    // Ensure factor is between 0 and 1
    factor = max(0, min(1, factor));

    // Extract RGB components
    int r = red;
    int g = green;
    int b = blue;

    // Make each component closer to 255 (white)
    r = r + ((255 - r) * factor).round();
    g = g + ((255 - g) * factor).round();
    b = b + ((255 - b) * factor).round();

    // Create and return the new color
    return Color.fromARGB(alpha, r, g, b);
  }
}
