import 'package:flutter/material.dart';
import 'package:veg_e_commerce/routes/nav_bar.dart';
import 'package:veg_e_commerce/screen/auth/login/forgot_password.dart';
import 'package:veg_e_commerce/screen/auth/login/login_screen.dart';
import 'package:veg_e_commerce/screen/auth/login/reset_password.dart';
import 'package:veg_e_commerce/screen/auth/register/otp_screen.dart';
import 'package:veg_e_commerce/screen/auth/register/register_screen.dart';
import 'package:veg_e_commerce/screen/boarding/boarding_screen.dart';
import '../screen/auth/login/verify_otp_screen.dart';
import '../screen/cart/cart_screen.dart';
import '../screen/category/category_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/profile/profile_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => BoardingScreen(),
    '/auth/login': (context) => LoginScreen(),
    '/auth/register': (context) => RegisterScreen(),
    '/auth/register/otp': (context) => OtpScreen(),
    '/auth/login/forgot_password': (context) => ForgotPassword(),
    '/auth/login/otp': (context) => VerifyOtpScreen(),
    '/auth/login/reset_password': (context) => ResetPassword(),
    '/nav_bar': (context) => CrystalNavBar(),
    '/home/home': (context) => HomeScreen(),
    '/category/category': (context) => CategoryScreen(),
    '/cart/cart': (context) => CartScreen(),
    '/profile/profile': (context) => ProfileScreen(),
  };
}
