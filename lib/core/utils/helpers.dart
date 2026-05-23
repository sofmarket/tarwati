import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:math';

Widget animationFunction(
  index,
  child, {
  Duration? listAnimation,
  Duration? slideduration,
  Duration? slidedelay,
}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: listAnimation ?? const Duration(milliseconds: 375),
    child: SlideAnimation(
      duration: slideduration ?? const Duration(milliseconds: 50),
      delay: slidedelay ?? const Duration(milliseconds: 50),
      child: FadeInAnimation(child: child),
    ),
  );
}

String generateRandomString({int length = 32}) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}

Color hexToColor(String hex) {
  hex = hex.replaceAll('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex'; // add full opacity if missing
  }
  return Color(int.parse(hex, radix: 16));
}

String maskPhone(String phone) {
  final digits = phone.replaceAll(RegExp(r'[\s\D]'), '');
  if (digits.length < 8) return phone;
  // Moroccan format: +212 6XXXXXXXX -> +212 6******XX
  if (digits.startsWith('212') && digits.length >= 10) {
    return '+212 ${digits[3]}${'*' * 7}${digits.substring(digits.length - 2)}';
  }
  return '+${digits.substring(0, 2)}${'*' * (digits.length - 4)}${digits.substring(digits.length - 2)}';
}
