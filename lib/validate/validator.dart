class Validator {
  static const String _emailPattern =
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';

  static final RegExp _emailRegex = RegExp(_emailPattern);

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please Enter your email';
    }

    if (!_emailRegex.hasMatch(email)) {
      return 'Please Enter a valid email';
    }
    return null;
  }
}
