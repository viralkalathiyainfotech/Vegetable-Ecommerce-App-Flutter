import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _otpFocus = FocusNode();

  bool _showPassword = true;
  bool _showNewPassword = true;
  bool _showConfirmPassword = true;
  bool _rememberMe = false;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get newPasswordController => _newPasswordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  TextEditingController get otpController => _otpController;

  FocusNode get emailFocus => _emailFocus;

  FocusNode get passwordFocus => _passwordFocus;

  FocusNode get newPasswordFocus => _newPasswordFocus;

  FocusNode get confirmPasswordFocus => _confirmPasswordFocus;

  bool get showPassword => _showPassword;

  bool get showNewPassword => _showNewPassword;

  bool get showConfirmPassword => _showConfirmPassword;

  bool get rememberMe => _rememberMe;

  FocusNode get otpFocus => _otpFocus;

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void toggleNewPasswordVisibility() {
    _showNewPassword = !_showNewPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _showConfirmPassword = !_showConfirmPassword;
    notifyListeners();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }
}
