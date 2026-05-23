import 'package:tarwati/core/utils/extensions.dart';
import 'package:tarwati/core/utils/app_regex.dart';
import 'package:tarwati/gen/strings.g.dart';

class CustomValidators {
  static String? validateRequired(dynamic value) {
    if (value == null || value.isEmpty) {
      return t.validation.required;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return t.validation.emailRequired;
    } else if (!AppRegex.isEmailValid(value)) {
      return t.validation.emailInvalid;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return t.validation.phoneRequired;
    } else if (!AppRegex.isPhoneNumberValid(value.add966IfNotAdded)) {
      return t.validation.phoneInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return t.validation.passwordRequired;
    }
    return null;
  }

  static String? validatePasswordConfirmation(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return t.validation.passwordConfirmationRequired;
    } else if (value != password) {
      return t.validation.passwordConfirmationNotMatch;
    }
    return null;
  }

  // rate app comment (must be at least 10 characters)
  static String? validateRateAppComment(String? value) {
    if (value == null || value.isEmpty) {
      return t.validation.required;
    } else if (value.length < 10) {
      return t.validation.mustBeAtLeast10Characters;
    }
    return null;
  }
}
