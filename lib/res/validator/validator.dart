/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
class Validators {
  final phoneNumberRegExp = RegExp(
      r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{9})$');
  final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');
  final mustContainCapital = RegExp(r'^(?=.*?[A-Z])');
  final mustContainNumber = RegExp(r'^(?=.*?[0-9])');
  final mustContainCharacter = RegExp(r'^(?=.*?[#?!@$%^&*-])');

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(value.trim())) {
      return 'Email is invalid';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value!.trim().isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!phoneNumberRegExp.hasMatch(value.trim())) {
      return 'Phone number is invalid';
    }
    return null;
  }

  String? validateZip(String value) {
    if (value.trim().isEmpty) {
      return 'Zip code cannot be empty';
    } else if (!zipCodeRegExp.hasMatch(value.trim())) {
      return 'Zip code is invalid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    }
    return null;
  }

  String? validateNewPassword(String? value, String? newValue) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    } else if (value.trim() == (newValue ?? "").trim()) {
      return 'New password cannot be the same as old';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? newValue) {
    if (value!.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password is too short';
    } else if (!mustContainCapital.hasMatch(value.trim())) {
      return 'Password must contain at least one upper case';
    } else if (!mustContainNumber.hasMatch(value.trim())) {
      return 'Password must contain at least one digit';
    } else if (!mustContainCharacter.hasMatch(value.trim())) {
      return 'at least one special character';
    } else if (value.trim() != (newValue ?? "").trim()) {
      return 'Password does not match';
    }
    return null;
  }

  String? validateEmptyTextField(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    //  else if (value.length <= 3) {
    //   return 'Entry is too short';
    // }
    return null;
  }

  String? validateName(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    } else if (value.contains(' ')) {
      return 'This field cannot contain blank spaces';
    } else if (RegExp(r'[!@#,.<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return 'This field can only contains alphabets';
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    } else if (value.contains(' ')) {
      return 'This field cannot contain blank spaces';
    } else if (value.length <= 4) {
      return 'Username too small';
    }
    return null;
  }

  String? validateReferralCode(String? value) {
    if (value!.trim().isEmpty) {
      return 'Referral code is required';
    } else if (value.length <= 7) {
      return 'Invalid referral code';
    }
    return null;
  }
}
/// validation for cards visa or master