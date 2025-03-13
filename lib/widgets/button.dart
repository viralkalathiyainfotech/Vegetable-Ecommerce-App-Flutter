import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/color.dart';
import 'package:veg_e_commerce/components/image_app.dart';
import 'package:veg_e_commerce/components/size_config.dart';

import '../routes/navigation.dart';

class AppButton extends StatefulWidget {
  const AppButton({super.key, required this.text, required this.onTap});

  final VoidCallback onTap;
  final String text;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: green,
      borderRadius: BorderRadius.circular(5),
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [buttonColor, buttonColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: ResponsiveDesign.fromLTRB(100, 12, 100, 12, context),
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: StringApp.inter,
              color: white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class OutlineButton extends StatefulWidget {
  const OutlineButton({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  State<OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: green,
      borderRadius: BorderRadius.circular(5),
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: [buttonColor, buttonColor2],
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
            ),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: ResponsiveDesign.fromLTRB(125, 12, 125, 12, context),
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: StringApp.inter,
              color: black,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialAuthButton extends StatefulWidget {
  const SocialAuthButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.image,
  });

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  State<SocialAuthButton> createState() => _SocialAuthButtonState();
}

class _SocialAuthButtonState extends State<SocialAuthButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: black.withOpacity(0.6), width: 0.7),
        ),
        child: Padding(
          padding: ResponsiveDesign.fromLTRB(50, 12, 50, 12, context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(widget.image),
              Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: StringApp.inter,
                  color: black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackIconButton extends StatefulWidget {
  const BackIconButton({super.key});

  @override
  State<BackIconButton> createState() => _BackIconButtonState();
}

class _BackIconButtonState extends State<BackIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<NavigationProvider>(context, listen: false).goBack(context);
      },
      child: SvgPicture.asset(ImageApp.icBack),
    );
  }
}
