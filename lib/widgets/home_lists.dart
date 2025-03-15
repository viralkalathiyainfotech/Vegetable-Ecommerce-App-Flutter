import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveDesign.height(200, context),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: ResponsiveDesign.horizontal(12, context),
        itemCount: widget.homeProvider.productList.length,
        itemBuilder: (context, index) {
          final product = widget.homeProvider.productList[index];
          return Padding(
            padding: ResponsiveDesign.horizontal(8, context),
            child: Container(
              width: ResponsiveDesign.width(160, context),
              decoration: BoxDecoration(
                color: Color(0xffF3F9FB),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xff0F0F0F).withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: ResponsiveDesign.fromLTRB(10, 5, 10, 10, context),
                    child: Image.asset(
                      product.image,
                      width: ResponsiveDesign.width(110, context),
                      height: ResponsiveDesign.height(110, context),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 113.5,
                    top: -0.2,
                    child: Container(
                      alignment: Alignment.center,
                      width: ResponsiveDesign.width(45, context),
                      height: ResponsiveDesign.height(45, context),
                      padding: ResponsiveDesign.all(5, context),
                      decoration: BoxDecoration(
                        color: buttonColor2,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        product.discount,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          fontFamily: StringApp.inter,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: ResponsiveDesign.fromLTRB(
                          10,
                          5,
                          10,
                          10,
                          context,
                        ),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          border: Border(
                            top: BorderSide(
                              color: Color(0xff0F0F0F).withOpacity(0.1),
                              width: 0.9,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: StringApp.inter,
                                color: black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              product.weight,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: StringApp.inter,
                                color: gray,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${product.price} ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StringApp.inter,
                                          color: black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: product.oldPrice,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StringApp.inter,
                                          color: gray,
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: gray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: ResponsiveDesign.width(15, context),
                                ),
                                Container(
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
                                    padding: ResponsiveDesign.fromLTRB(
                                      14,
                                      5,
                                      14,
                                      5,
                                      context,
                                    ),
                                    child: Text(
                                      StringApp.add,
                                      style: TextStyle(
                                        fontFamily: StringApp.inter,
                                        color: buttonColor2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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

class BannerList extends StatefulWidget {
  const BannerList({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  @override
  State<BannerList> createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveDesign.height(150, context),
      child: ListView.builder(
        itemCount: widget.homeProvider.bannerList.length,
        shrinkWrap: true,
        padding: ResponsiveDesign.horizontal(12, context),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final banner = widget.homeProvider.bannerList[index];
          return Padding(
            padding: ResponsiveDesign.horizontal(8, context),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(banner['image']),
                ),
                Padding(
                  padding: ResponsiveDesign.horizontal(10, context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientText(
                        gradientType: GradientType.linear,
                        gradientDirection: GradientDirection.rtl,
                        banner['text'],
                        colors: banner['gradient'],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          fontFamily: StringApp.inter,
                        ),
                      ),
                      SizedBox(height: ResponsiveDesign.height(4, context)),

                      Text(
                        banner['subTitle'],
                        style: TextStyle(
                          fontFamily: StringApp.inter,
                          color: gray,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: ResponsiveDesign.height(10, context)),
                      Container(
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
                          padding: ResponsiveDesign.fromLTRB(
                            15,
                            5,
                            15,
                            5,
                            context,
                          ),
                          child: Text(
                            StringApp.orderNow,
                            style: TextStyle(
                              fontFamily: StringApp.inter,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          ),
                        ),
                      ),
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

class SeasonalList extends StatefulWidget {
  const SeasonalList({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  @override
  State<SeasonalList> createState() => _SeasonalListState();
}

class _SeasonalListState extends State<SeasonalList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveDesign.height(200, context),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: ResponsiveDesign.horizontal(12, context),
        itemCount: widget.homeProvider.seasonalList.length,
        itemBuilder: (context, index) {
          final seasonal = widget.homeProvider.seasonalList[index];
          return Padding(
            padding: ResponsiveDesign.horizontal(8, context),
            child: Container(
              width: ResponsiveDesign.width(160, context),
              decoration: BoxDecoration(
                color: Color(0xffF3F9FB),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xff0F0F0F).withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: ResponsiveDesign.fromLTRB(10, 5, 10, 10, context),
                    child: Image.asset(
                      seasonal.image,
                      width: ResponsiveDesign.width(110, context),
                      height: ResponsiveDesign.height(110, context),
                      fit: BoxFit.fill,
                    ),
                  ),
                  if (seasonal.discount.isNotEmpty) ...[
                    Positioned(
                      left: 113.5,
                      top: -0.2,
                      child: Container(
                        alignment: Alignment.center,
                        width: ResponsiveDesign.width(45, context),
                        height: ResponsiveDesign.height(45, context),
                        padding: ResponsiveDesign.all(5, context),
                        decoration: BoxDecoration(
                          color: buttonColor2,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          seasonal.discount,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            fontFamily: StringApp.inter,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: ResponsiveDesign.fromLTRB(
                          10,
                          5,
                          10,
                          10,
                          context,
                        ),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          border: Border(
                            top: BorderSide(
                              color: Color(0xff0F0F0F).withOpacity(0.1),
                              width: 0.9,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              seasonal.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: StringApp.inter,
                                color: black,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              seasonal.weight,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: StringApp.inter,
                                color: gray,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${seasonal.price} ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StringApp.inter,
                                          color: black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: seasonal.oldPrice,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: StringApp.inter,
                                          color: gray,
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: gray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: ResponsiveDesign.width(15, context),
                                ),
                                Container(
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
                                    padding: ResponsiveDesign.fromLTRB(
                                      14,
                                      5,
                                      14,
                                      5,
                                      context,
                                    ),
                                    child: Text(
                                      StringApp.add,
                                      style: TextStyle(
                                        fontFamily: StringApp.inter,
                                        color: buttonColor2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSavedTime();
    countdownEndTime = DateTime.now();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  static const countdownDuration = Duration(days: 326);
  late DateTime countdownEndTime;
  late Timer timer;
  Duration remainingTime = Duration.zero;

  Future<void> loadSavedTime() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEndTime = prefs.getString('countdown_end_time');
    if (savedEndTime != null) {
      countdownEndTime = DateTime.parse(savedEndTime);
    } else {
      await startNewCountdown();
    }
    _startTimer();
  }

  Future<void> startNewCountdown() async {
    final prefs = await SharedPreferences.getInstance();
    countdownEndTime = DateTime.now().add(countdownDuration);
    await prefs.setString(
      'countdown_end_time',
      countdownEndTime.toIso8601String(),
    );
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime = getRemainingTime();
      setState(() {
        if (remainingTime.isNegative) {
          timer.cancel();
        }
      });
    });
  }

  Duration getRemainingTime() {
    final now = DateTime.now();
    if (countdownEndTime.isBefore(now)) {
      return Duration.zero;
    } else {
      return countdownEndTime.difference(now);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveDesign.horizontal(20, context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset('assets/images/offer.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: ResponsiveDesign.all(20, context),
            child: Container(
              decoration: BoxDecoration(
                color: whiteSmoke.withOpacity(0.6),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: ResponsiveDesign.fromLTRB(10, 20, 10, 13, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "35%",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: StringApp.inter,
                              color: red,
                            ),
                          ),
                          TextSpan(
                            text: " OFF",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: StringApp.inter,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(5, context)),
                    Text(
                      "Hurry! Limited Stock",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: StringApp.inter,
                        color: black,
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(5, context)),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        fontFamily: StringApp.inter,
                        color: black,
                      ),
                    ),
                    SizedBox(height: ResponsiveDesign.height(5, context)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: black, width: 1),
                      ),
                      child: Padding(
                        padding: ResponsiveDesign.all(10, context),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            offerTime(
                              getRemainingTime().inDays
                                  .remainder(326)
                                  .toString(),
                              "Days",
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontFamily: StringApp.inter,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            offerTime(
                              getRemainingTime().inHours
                                  .remainder(24)
                                  .toString(),
                              "Hours",
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontFamily: StringApp.inter,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            offerTime(
                              getRemainingTime().inMinutes
                                  .remainder(60)
                                  .toString(),
                              "Min",
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontFamily: StringApp.inter,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            offerTime(
                              getRemainingTime().inSeconds
                                  .remainder(60)
                                  .toString(),
                              "Sec",
                            ),
                          ],
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
    );
  }

  Widget offerTime(String time, String type) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: StringApp.inter,
            color: black,
          ),
        ),
        Text(
          type,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: StringApp.inter,
            color: black,
          ),
        ),
      ],
    );
  }
}

class GridViewProduct extends StatefulWidget {
  const GridViewProduct({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  @override
  State<GridViewProduct> createState() => _GridViewProductState();
}

class _GridViewProductState extends State<GridViewProduct> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: ResponsiveDesign.horizontal(20, context),
      itemCount: widget.homeProvider.gridProductList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        childAspectRatio: 9 /12,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final gridProduct = widget.homeProvider.gridProductList[index];
        return Container(
          width: ResponsiveDesign.width(160, context),
          decoration: BoxDecoration(
            color: Color(0xffF3F9FB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xff0F0F0F).withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: ResponsiveDesign.fromLTRB(10, 5, 10, 10, context),
                child: Image.asset(
                  gridProduct.image,
                  width: ResponsiveDesign.width(100, context),
                  height: ResponsiveDesign.height(100, context),
                  fit: BoxFit.fill,
                ),
              ),
              if (gridProduct.discount.isNotEmpty) ...[
                Positioned(
                  left: 105.5,
                  top: -0.2,
                  child: Container(
                    alignment: Alignment.center,
                    width: ResponsiveDesign.width(45, context),
                    height: ResponsiveDesign.height(45, context),
                    padding: ResponsiveDesign.all(5, context),
                    decoration: BoxDecoration(
                      color: buttonColor2,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      gridProduct.discount,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        fontFamily: StringApp.inter,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: ResponsiveDesign.fromLTRB(10, 5, 10, 10, context),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: Color(0xff0F0F0F).withOpacity(0.1),
                          width: 0.9,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gridProduct.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: StringApp.inter,
                            color: black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          gridProduct.weight,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: StringApp.inter,
                            color: gray,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${gridProduct.price} ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StringApp.inter,
                                      color: black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: gridProduct.oldPrice,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: StringApp.inter,
                                      color: gray,
                                      fontSize: 15,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: gray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
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
                                padding: ResponsiveDesign.fromLTRB(
                                  14,
                                  5,
                                  14,
                                  5,
                                  context,
                                ),
                                child: Text(
                                  StringApp.add,
                                  style: TextStyle(
                                    fontFamily: StringApp.inter,
                                    color: buttonColor2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
