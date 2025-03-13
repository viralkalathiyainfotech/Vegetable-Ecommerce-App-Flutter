import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/color.dart';
import 'package:veg_e_commerce/components/size_config.dart';
import 'package:veg_e_commerce/screen/boarding/boarding_provider.dart';
import 'package:veg_e_commerce/utils/shared_preferences_provider.dart';
import 'package:veg_e_commerce/widgets/button.dart';

import '../../routes/navigation.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<BoardingProvider, SharePreferenceProvider>(
        builder: (context, value, preferenceProvider, child) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                onPageChanged: (v) {
                  value.count = v;
                },
                physics: BouncingScrollPhysics(),
                controller: value.controller,
                itemCount: value.boardingList.length,
                itemBuilder: (context, index) {
                  final boardingData = value.boardingList[index];
                  return Stack(
                    children: [
                      Image.asset(boardingData['image']),
                      Padding(
                        padding: ResponsiveDesign.horizontal(20, context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              boardingData['text'],
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: StringApp.inter,
                                color: black,
                                height: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: ResponsiveDesign.height(12, context),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              boardingData['description'],
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.4,
                                fontFamily: StringApp.inter,
                                color: gray,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            if (value.count ==
                                value.boardingList.length - 1) ...[
                              SizedBox(
                                height: ResponsiveDesign.height(190, context),
                              ),
                            ] else ...[
                              SizedBox(
                                height: ResponsiveDesign.height(120, context),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: ResponsiveDesign.horizontal(20, context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (value.count == value.boardingList.length - 1) ...[
                      AppButton(
                        text: StringApp.register,
                        onTap: () {
                          preferenceProvider.completeBoarding();
                          Provider.of<NavigationProvider>(
                            context,
                            listen: false,
                          ).changeRoute('/auth/register', context);
                        },
                      ),
                      SizedBox(height: ResponsiveDesign.height(20, context)),
                      OutlineButton(
                        text: StringApp.login,
                        onTap: () {
                          preferenceProvider.completeBoarding();
                          Provider.of<NavigationProvider>(
                            context,
                            listen: false,
                          ).changeRoute('/auth/login', context);
                        },
                      ),
                    ] else ...[
                      AppButton(
                        text: StringApp.continues,
                        onTap: () {
                          value.controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                    SizedBox(height: ResponsiveDesign.height(20, context)),
                    SmoothPageIndicator(
                      controller: value.controller,
                      count: value.boardingList.length,
                      effect: WormEffect(
                        paintStyle: PaintingStyle.fill,
                        activeDotColor: buttonColor2,
                        dotColor: buttonColor.withOpacity(0.25),
                        radius: 8,
                        dotWidth: 21,
                        dotHeight: 8,
                        type: WormType.normal,
                        activeGradient: LinearGradient(
                          colors: [buttonColor2, buttonColor],
                        ),
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(20, context)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
