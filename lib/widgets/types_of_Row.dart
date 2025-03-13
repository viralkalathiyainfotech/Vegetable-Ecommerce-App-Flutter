import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/color.dart';
import 'package:veg_e_commerce/components/size_config.dart';
import 'package:veg_e_commerce/routes/navigation.dart';

class TypesOfRow extends StatefulWidget {
  const TypesOfRow({super.key, required this.text});

  final String text;

  @override
  State<TypesOfRow> createState() => _TypesOfRowState();
}

class _TypesOfRowState extends State<TypesOfRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveDesign.horizontal(20, context),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientText(
                widget.text,
                colors: [buttonColor2, buttonColor],
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: StringApp.inter,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<NavigationProvider>().navBarController.jumpToTab(
                    1,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      StringApp.viewAll,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: StringApp.inter,
                        fontSize: 14,
                        color: black.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(width: ResponsiveDesign.width(5, context)),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: black.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveDesign.height(10, context)),
          Row(
            children: [
              Flexible(
                child: Container(width: 320, color: buttonColor2, height: 1.5),
              ),
              Flexible(
                child: Container(
                  width: 320,
                  color: gray.withOpacity(0.3),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
