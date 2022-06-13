class Validation {
  static bool phoneNumber(String? phone) {
    bool result = false;
    if (phone != null) {
      List<String> validNumber = ['+628', '628', '08', '8'];

      List valid = validNumber.where((elm) => phone.startsWith(elm)).toList();
      result = valid.isNotEmpty;
    }

    return result;
  }

  static String? passwordValid(String? value) {
    if (value != null && !value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain lowercase';
    }
    if (value != null && !value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain uppercase';
    }
    if (value != null && !value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain number';
    }

    return null;
  }
}
