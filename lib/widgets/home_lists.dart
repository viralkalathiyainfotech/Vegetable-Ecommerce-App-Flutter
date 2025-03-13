import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/color.dart';
import 'package:veg_e_commerce/components/size_config.dart';
import 'package:veg_e_commerce/screen/home/home_provider.dart';

class HomeLists extends StatefulWidget {
  const HomeLists({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  @override
  State<HomeLists> createState() => _HomeListsState();
}

class _HomeListsState extends State<HomeLists> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveDesign.height(110, context),
      child: ListView.builder(
        padding: ResponsiveDesign.horizontal(6, context),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.homeProvider.topCategoriesList.length,
        itemBuilder: (context, index) {
          final topCategory = widget.homeProvider.topCategoriesList[index];
          return Padding(
            padding: ResponsiveDesign.horizontal(14, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  topCategory['image'],
                  width: ResponsiveDesign.width(79, context),
                  height: ResponsiveDesign.height(79, context),
                ),
                SizedBox(height: ResponsiveDesign.height(5, context)),
                GradientText(
                  textAlign: TextAlign.center,
                  topCategory['text'],
                  colors: [buttonColor2, Color(0xff6B7B3E)],
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: StringApp.inter,
                    fontWeight: FontWeight.w600,
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
