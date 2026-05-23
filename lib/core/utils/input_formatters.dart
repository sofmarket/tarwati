import 'dart:math';

import 'package:flutter/services.dart';

extension StringExtension on String {
   bool containsAny(List<String> values) {
    return values.any((value) => contains(value));
  }
}

abstract class InputFormatters {
  static TextInputFormatter digits = FilteringTextInputFormatter.digitsOnly;
  static TextInputFormatter name = FilteringTextInputFormatter(
      RegExp(r'[a-zA-ZÀ-ÿ\u0600-\u06FF\s-]'),
      allow: true);
  static TextInputFormatter noSpace = NoSpaceFormatter();

  // 0(5|6|7|9)xxxxxxxxx (0 required)
  static TextInputFormatter phone = PhoneFormatter();
}

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    final oldText = oldValue.text;

    // prevent user from deleting the first digit
    if (newText.length < oldText.length && newText.startsWith('0')) {
      return newValue;
    }

    // prevent user from entering non-digits
    final numbersOnlyRegex = RegExp(r'\d+');
    final isNewTextValid = numbersOnlyRegex.hasMatch(newText);
    if (!isNewTextValid) return oldValue;

    // prevent user from entering more than 10 digits
    var result = '';

    if (newText.length == 1 && newText != '0') {
      result = '0$newText';
    } else if (newText.length <= 10) {
      result = newText;
    } else {
      result = oldText;
    }

    return newValue.copyWith(
      text: result,
      selection: TextSelection.fromPosition(
        TextPosition(offset: result.length),
      ),
    );
  }
}

class NoSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final hasEmptySpace = newValue.text.containsAny([' ', '\n', '\t']);
    if (hasEmptySpace) {
      return TextEditingValue(
        text: newValue.text.replaceAll(RegExp(r'\s'), ''),
        selection: oldValue.selection,
      );
    }
    return newValue;
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.length < oldValue.text.length) return newValue;

    var result = '';

    if (newText.contains('/')) {
      final dates = newText.split('/');
      final month = dates.first;
      final year = dates.last;
      if (year.length >= 2) {
        result = '$month/${year.substring(0, 2)}';
      } else {
        result = newText;
      }
    } else {
      if (newText.length == 2) {
        result = '$newText/';
      } else {
        result = newText;
      }
    }

    return newValue.copyWith(
      text: result,
      selection: TextSelection.fromPosition(
        TextPosition(offset: result.length),
      ),
    );
  }
}

class CvvFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.length < oldValue.text.length) return newValue;

    var result = '';

    if (newText.length == 3) {
      result = newText;
    } else {
      result = newText.substring(0, min(3, newText.length));
    }

    result = int.tryParse(result) == null ? '' : result;

    return newValue.copyWith(
      text: result,
      selection: TextSelection.fromPosition(
        TextPosition(offset: result.length),
      ),
    );
  }
}
