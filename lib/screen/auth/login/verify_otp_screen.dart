import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/components/size_config.dart';
import 'package:veg_e_commerce/screen/auth/login/login_provider.dart';
import 'package:veg_e_commerce/screen/auth/register/register_provider.dart';
import 'package:veg_e_commerce/widgets/button.dart';

import '../../../components/app_string.dart';
import '../../../components/color.dart';
import '../../../routes/navigation.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: Padding(
              padding: ResponsiveDesign.horizontal(20, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ResponsiveDesign.height(20, context)),
                  BackIconButton(),
                  SizedBox(height: ResponsiveDesign.height(20, context)),
                  Center(
                    child: Text(
                      StringApp.verifyOtp,
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
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(text: StringApp.weSentCode),
                          TextSpan(
                            text: value.emailController.text,
                            style: TextStyle(
                              fontFamily: StringApp.inter,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          WidgetSpan(
                            child: Text(
                              StringApp.pleaseEnterIt,
                              style: TextStyle(
                                fontFamily: StringApp.inter,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontFamily: StringApp.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  SizedBox(height: ResponsiveDesign.height(20, context)),
                  Align(
                    alignment: Alignment.center,
                    child: Pinput(
                      autofocus: false,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      defaultPinTheme: PinTheme(
                        width: ResponsiveDesign.width(50, context),
                        height: ResponsiveDesign.height(50, context),
                        decoration: BoxDecoration(
                          color: black.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      focusNode: value.otpFocus,
                      onChanged: (value) {},
                      showCursor: true,
                      keyboardType: TextInputType.number,
                      length: 6,
                      controller: value.otpController,
                    ),
                  ),
                  SizedBox(height: ResponsiveDesign.height(50, context)),
                  AppButton(text: StringApp.verifyOtp, onTap: () {
                    Provider.of<NavigationProvider>(
                      context,
                      listen: false,
                    ).changeRoute('/auth/login/reset_password', context);
                  }),
                  SizedBox(height: ResponsiveDesign.height(20, context)),
                  Center(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: StringApp.didNotReceivedCode,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: StringApp.inter,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: StringApp.resend,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
