import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/components/size_config.dart';
import 'package:veg_e_commerce/screen/auth/login/login_provider.dart';

import '../../../components/app_string.dart';
import '../../../components/color.dart';
import '../../../routes/navigation.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, login, child) {
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
                      StringApp.resetPassword,
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
                      StringApp.createUniquePassword,
                      style: TextStyle(
                        fontFamily: StringApp.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  SizedBox(height: ResponsiveDesign.height(30, context)),
                  Text(
                    StringApp.newPassword,
                    style: TextStyle(
                      fontFamily: StringApp.inter,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: black,
                    ),
                  ),
                  SizedBox(height: ResponsiveDesign.height(5, context)),
                  CustomTextField(
                    showPassword: login.showNewPassword,
                    focusNode: login.newPasswordFocus,
                    controller: login.newPasswordController,
                    hintText: StringApp.newPassword,
                    suffix: InkWell(
                      onTap: () {
                        login.toggleNewPasswordVisibility();
                      },
                      child: Padding(
                        padding: ResponsiveDesign.all(10, context),
                        child: Icon(
                          login.showNewPassword
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: 20,
                          color: gray.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ResponsiveDesign.height(15, context)),
                  Text(
                    StringApp.confirmPassword,
                    style: TextStyle(
                      fontFamily: StringApp.inter,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: black,
                    ),
                  ),
                  SizedBox(height: ResponsiveDesign.height(5, context)),
                  CustomTextField(
                    showPassword: login.showConfirmPassword,
                    focusNode: login.confirmPasswordFocus,
                    controller: login.confirmPasswordController,
                    hintText: StringApp.confirmPassword,
                    suffix: InkWell(
                      onTap: () {
                        login.toggleConfirmPasswordVisibility();
                      },
                      child: Padding(
                        padding: ResponsiveDesign.all(10, context),
                        child: Icon(
                          login.showConfirmPassword
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: 20,
                          color: gray.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ResponsiveDesign.height(40, context)),
                  AppButton(
                    text: StringApp.resetPassword,
                    onTap: () {
                      Provider.of<NavigationProvider>(
                        context,
                        listen: false,
                      ).goBack(context);
                      Provider.of<NavigationProvider>(
                        context,
                        listen: false,
                      ).goBack(context);
                      Provider.of<NavigationProvider>(
                        context,
                        listen: false,
                      ).goBack(context);
                    },
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
