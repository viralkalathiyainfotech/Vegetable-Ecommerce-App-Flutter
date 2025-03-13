import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/screen/auth/login/login_provider.dart';

import '../../../components/app_string.dart';
import '../../../components/color.dart';
import '../../../components/size_config.dart';
import '../../../routes/navigation.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: ResponsiveDesign.horizontal(20, context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ResponsiveDesign.height(20, context)),
                      BackIconButton(),
                      SizedBox(height: ResponsiveDesign.height(20, context)),
                      Center(
                        child: Text(
                          StringApp.forgotPassword,
                          style: TextStyle(
                            fontFamily: StringApp.inter,
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            color: black,
                          ),
                        ),
                      ),
                      SizedBox(height: ResponsiveDesign.height(5, context)),
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          StringApp.recoverYourAccount,
                          style: TextStyle(
                            fontFamily: StringApp.inter,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(height: ResponsiveDesign.height(20, context)),
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
                        focusNode: value.emailFocus,
                        controller: value.emailController,
                        hintText: StringApp.yourEmail,
                      ),
                      SizedBox(height: ResponsiveDesign.height(50, context)),
                      AppButton(text: StringApp.sendCode, onTap: () {
                        Provider.of<NavigationProvider>(
                          context,
                          listen: false,
                        ).changeRoute('/auth/login/otp', context);
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
