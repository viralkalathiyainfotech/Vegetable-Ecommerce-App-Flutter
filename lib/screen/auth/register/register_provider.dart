import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _mobileNoFocus = FocusNode();
  final FocusNode _otpFocus = FocusNode();
  bool _showPassword = true;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get nameController => _nameController;

  TextEditingController get mobileNoController => _mobileNoController;

  TextEditingController get otpController => _otpController;

  FocusNode get emailFocus => _emailFocus;

  FocusNode get passwordFocus => _passwordFocus;

  FocusNode get nameFocus => _nameFocus;

  FocusNode get mobileNoFocus => _mobileNoFocus;

  FocusNode get otpFocus => _otpFocus;

  bool get showPassword => _showPassword;

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }
}
