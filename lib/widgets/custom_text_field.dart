import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veg_e_commerce/components/app_string.dart';

import '../components/color.dart';
import '../components/size_config.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
        required this.controller,
        required this.hintText,
        this.labelText,
        this.prefix,
        this.readOnly = false,
        this.showPassword = false,
        this.suffix,
        this.textInputType,
        this.focusNode,
        this.errorText,
        this.maxLength,
        this.validator,
        this.inputFormatters});

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool? readOnly;
  final bool? showPassword;
  final Widget? prefix;
  final int? maxLength;
  final Widget? suffix;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  String? errorText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: ResponsiveDesign.height(44, context),
          padding:
          ResponsiveDesign.only(context, left: 10, top: 4, bottom: 4),
          decoration: BoxDecoration(
              color: black.withOpacity(0.07),
              borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            onChanged: (value) {
              setState(() {
                widget.errorText = widget.validator?.call(value);
              });
            },
            autocorrect: true,
            canRequestFocus: true,
            validator: widget.validator,
            focusNode: widget.focusNode,
            style: TextStyle(
                fontFamily: StringApp.inter,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: black),
            controller: widget.controller,
            autofocus: false,
            keyboardType: widget.textInputType,
            cursorColor: green,
            readOnly: widget.readOnly ?? false,
            obscureText: widget.showPassword ?? false,
            decoration: InputDecoration(
              contentPadding: ResponsiveDesign.only(context,bottom:12,top:3),
                alignLabelWithHint: true,
                hintStyle: TextStyle(
                    fontFamily: StringApp.inter,
                    color: gray.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.hintText,
                labelText: widget.labelText,
                prefixIcon: widget.prefix,
                suffixIcon: widget.suffix),
          ),
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty) ...[
          Text(
            widget.errorText!,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 9,
                fontFamily: StringApp.inter,
                color: red),
          )
        ],
      ],
    );
  }
}
