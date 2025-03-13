import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/screen/auth/register/register_provider.dart';

import '../../../components/app_string.dart';
import '../../../components/color.dart';
import '../../../components/image_app.dart';
import '../../../components/size_config.dart';
import '../../../routes/navigation.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RegisterProvider>(
        builder: (context, register, child) {
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
                        StringApp.register,
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
                        textAlign: TextAlign.center,
                        StringApp.registerYourAccount,
                        style: TextStyle(
                          fontFamily: StringApp.inter,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(20, context)),
                    Text(
                      StringApp.fullName,
                      style: TextStyle(
                        fontFamily: StringApp.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: black,
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(5, context)),
                    CustomTextField(
                      focusNode: register.nameFocus,
                      controller: register.nameController,
                      hintText: StringApp.fullName,
                    ),
                    SizedBox(height: ResponsiveDesign.height(15, context)),
                    Text(
                      StringApp.mobileNo,
                      style: TextStyle(
                        fontFamily: StringApp.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: black,
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(5, context)),
                    CustomTextField(
                      focusNode: register.mobileNoFocus,
                      controller: register.mobileNoController,
                      hintText: StringApp.yourMobileNo,
                    ),
                    SizedBox(height: ResponsiveDesign.height(15, context)),
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
                      focusNode: register.emailFocus,
                      controller: register.emailController,
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
                      showPassword: register.showPassword,
                      focusNode: register.passwordFocus,
                      controller: register.passwordController,
                      hintText: StringApp.yourPassword,
                      suffix: InkWell(
                        onTap: () {
                          register.togglePasswordVisibility();
                        },
                        child: Padding(
                          padding: ResponsiveDesign.all(10, context),
                          child: Icon(
                            register.showPassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            size: 20,
                            color: gray.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(30, context)),
                    AppButton(
                      text: StringApp.register,
                      onTap: () {
                        Provider.of<NavigationProvider>(
                          context,
                          listen: false,
                        ).changeRoute('/auth/register/otp', context);
                      },
                    ),
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
                text: StringApp.alreadyAccount,
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
                    ).goBack(context);
                  },
                text: StringApp.login,
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
