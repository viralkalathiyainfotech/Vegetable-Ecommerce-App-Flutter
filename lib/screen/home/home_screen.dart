import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/color.dart';
import 'package:veg_e_commerce/components/image_app.dart';
import 'package:veg_e_commerce/components/size_config.dart';
import 'package:veg_e_commerce/screen/home/home_provider.dart';
import 'package:veg_e_commerce/widgets/custom_text_field.dart';
import 'package:veg_e_commerce/widgets/home_lists.dart';
import 'package:veg_e_commerce/widgets/types_of_Row.dart';

import '../../routes/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: white,
        statusBarColor: Colors.transparent,
      ),
    );
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: whiteSmoke.withOpacity(0.4),
        body: Consumer<HomeProvider>(
          builder: (context, home, child) {
            return Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      ImageApp.background,
                      width: double.infinity,
                      height: ResponsiveDesign.height(220, context),
                      fit: BoxFit.fill,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: ResponsiveDesign.horizontal(20, context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: ResponsiveDesign.height(20, context),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Welcome ",
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 14,
                                      fontFamily: StringApp.inter,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Martin",
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 15,
                                      fontFamily: StringApp.inter,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ResponsiveDesign.height(10, context),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(ImageApp.location),
                                SizedBox(
                                  width: ResponsiveDesign.width(10, context),
                                ),
                                Text(
                                  "Deliver to Surat 395006",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    fontFamily: StringApp.inter,
                                    color: white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ResponsiveDesign.height(50, context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: ResponsiveDesign.fromLTRB(
                        20,
                        0,
                        20,
                        35,
                        context,
                      ),
                      child: InkWell(
                        onTap: () {
                          Provider.of<NavigationProvider>(
                            context,
                            listen: false,
                          ).changeRoute('/home/search', context);
                        },
                        child: Container(
                          padding: ResponsiveDesign.fromLTRB(
                            15,
                            12,
                            15,
                            12,
                            context,
                          ),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageApp.icSearch),
                              Padding(
                                padding: ResponsiveDesign.only(
                                  context,
                                  left: 10,
                                ),
                                child: Text(
                                  "Search for Vegetables...",
                                  style: TextStyle(
                                    fontFamily: StringApp.inter,
                                    color: gray.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(ImageApp.homeBg, fit: BoxFit.fill),
                        Column(
                          children: [
                            SizedBox(
                              height: ResponsiveDesign.height(20, context),
                            ),
                            TypesOfRow(text: StringApp.topCategories),
                            SizedBox(
                              height: ResponsiveDesign.height(20, context),
                            ),
                            HomeLists(homeProvider: home),
                            SizedBox(
                              height: ResponsiveDesign.height(30, context),
                            ),
                            TypesOfRow(text: StringApp.gardenFresh),
                            SizedBox(
                              height: ResponsiveDesign.height(20, context),
                            ),
                            ProductList(homeProvider: home),
                            SizedBox(
                              height: ResponsiveDesign.height(30, context),
                            ),
                            BannerList(homeProvider: home),
                            SizedBox(
                              height: ResponsiveDesign.height(30, context),
                            ),
                            TypesOfRow(text: StringApp.seasonalSelections),
                            SizedBox(
                              height: ResponsiveDesign.height(20, context),
                            ),
                            SeasonalList(homeProvider: home),
                            SizedBox(
                              height: ResponsiveDesign.height(30, context),
                            ),
                            TypesOfRow(text: StringApp.specialOffer),
                            SizedBox(
                              height: ResponsiveDesign.height(20, context),
                            ),
                            OfferView(),
                            SizedBox(
                              height: ResponsiveDesign.height(20, context),
                            ),
                            GridViewProduct(homeProvider: home),
                            SizedBox(
                              height: ResponsiveDesign.height(80, context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
