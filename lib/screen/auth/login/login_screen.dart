import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/color.dart';
import 'package:veg_e_commerce/components/image_app.dart';
import 'package:veg_e_commerce/components/size_config.dart';
import 'package:veg_e_commerce/screen/auth/login/login_provider.dart';
import 'package:veg_e_commerce/widgets/button.dart';
import 'package:veg_e_commerce/widgets/custom_text_field.dart';

import '../../../routes/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, login, child) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: ResponsiveDesign.horizontal(20, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ResponsiveDesign.height(20, context)),
                    Center(
                      child: Text(
                        StringApp.login,
                        style: TextStyle(
                          fontFamily: StringApp.inter,
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: black,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        StringApp.welcomeBack,
                        style: TextStyle(
                          fontFamily: StringApp.inter,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(40, context)),
                    Text(
                      StringApp.email,
                      style: TextStyle(
                        fontFamily: StringApp.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: black,
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(5, context)),
                    CustomTextField(
                      focusNode: login.emailFocus,
                      controller: login.emailController,
                      hintText: StringApp.yourEmail,
                    ),
                    SizedBox(height: ResponsiveDesign.height(15, context)),
                    Text(
                      StringApp.password,
                      style: TextStyle(
                        fontFamily: StringApp.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: black,
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(5, context)),
                    CustomTextField(
                      showPassword: login.showPassword,
                      focusNode: login.passwordFocus,
                      controller: login.passwordController,
                      hintText: StringApp.yourPassword,
                      suffix: InkWell(
                        onTap: () {
                          login.togglePasswordVisibility();
                        },
                        child: Padding(
                          padding: ResponsiveDesign.all(10, context),
                          child: Icon(
                            login.showPassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 20,
                            color: gray.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(8, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                login.toggleRememberMe();
                              },
                              child: Container(
                                width: ResponsiveDesign.width(18, context),
                                height: ResponsiveDesign.height(18, context),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      login.rememberMe
                                          ? buttonColor2
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(2),
                                  border: login.rememberMe?null:Border.all(
                                    color: black.withOpacity(0.6),
                                    width: 0.8,
                                  ),
                                ),
                                child:
                                    login.rememberMe
                                        ? const Icon(
                                          Icons.check_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        )
                                        : null,
                              ),
                            ),
                            SizedBox(width: ResponsiveDesign.width(8, context)),
                            Text(
                              StringApp.rememberMe,
                              style: TextStyle(
                                color: gray,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                fontFamily: StringApp.inter,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(7),
                          onTap: () {
                            Provider.of<NavigationProvider>(
                              context,
                              listen: false,
                            ).changeRoute('/auth/login/forgot_password', context);
                          },
                          child: Padding(
                            padding: ResponsiveDesign.all(3, context),
                            child: Text(
                              StringApp.forgotPassword,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: red,
                                fontSize: 13,
                                fontFamily: StringApp.inter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveDesign.height(40, context)),
                    AppButton(text: StringApp.login, onTap: () {
                      Provider.of<NavigationProvider>(
                        context,
                        listen: false,
                      ).changeRoute('/nav_bar', context);
                    }),
                    SizedBox(height: ResponsiveDesign.height(30, context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 0.7,
                          width: 125,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff141414), Color(0xff7A7A7A)],
                              end: Alignment.centerLeft,
                              begin: Alignment.centerRight,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            textAlign: TextAlign.center,
                            StringApp.or,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: StringApp.inter,
                            ),
                          ),
                        ),
                        Container(
                          height: 0.7,
                          width: 125,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff141414), Color(0xff7A7A7A)],
                              end: Alignment.centerRight,
                              begin: Alignment.centerLeft,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveDesign.height(30, context)),
                    SocialAuthButton(
                      text: StringApp.signWithGoogle,
                      onTap: () {},
                      image: ImageApp.icGoogle,
                    ),
                    SizedBox(height: ResponsiveDesign.height(20, context)),
                    SocialAuthButton(
                      text: StringApp.signWithFaceBook,
                      onTap: () {},
                      image: ImageApp.icFaceBook,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: ResponsiveDesign.only(context, top: 10, bottom: 15),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: StringApp.didNotAccount,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: StringApp.inter,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        Provider.of<NavigationProvider>(
                          context,
                          listen: false,
                        ).changeRoute('/auth/register', context);
                      },
                text: StringApp.register,
                style: TextStyle(
                  color: buttonColor2,
                  fontFamily: StringApp.inter,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: buttonColor2
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
