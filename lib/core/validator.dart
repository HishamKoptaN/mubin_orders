class Validator {
  static String? validatePhoneNum({
    required String? value,
  }) {
    final sanitizedValue = value?.replaceAll(' ', '') ?? '';
    if (sanitizedValue.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (!RegExp(r'^\d+$').hasMatch(sanitizedValue)) {
      return 'الرقم يجب أن يحتوي على أرقام فقط';
    }
    if (sanitizedValue.length < 7) {
      return 'الرقم يجب أن يكون أكثر من 6 أرقام';
    }
    return null;
  }

  static String? customValidator({
    required String value,
  }) {
    if (value.isEmpty) {
      return "مطلوب";
    }
    return null;
  }

  static String? emailValidator({
    required String value,
  }) {
    if (value.isEmpty) {
      return "مطلوب";
    } else if (!RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(
      value,
    )) {
      return "بريد الكتروني غير صالح";
    }
    return null;
  }
}
