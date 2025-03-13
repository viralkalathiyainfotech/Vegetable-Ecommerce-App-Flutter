import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/image_app.dart';
import 'package:veg_e_commerce/screen/cart/cart_screen.dart';
import 'package:veg_e_commerce/screen/category/category_screen.dart';
import 'package:veg_e_commerce/screen/home/home_screen.dart';
import 'package:veg_e_commerce/screen/profile/profile_screen.dart';

import '../components/color.dart';
import 'navigation.dart';

class CrystalNavBar extends StatefulWidget {
  const CrystalNavBar({super.key});

  @override
  State<CrystalNavBar> createState() => _CrystalNavBarState();
}

class _CrystalNavBarState extends State<CrystalNavBar>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, value, child) {
        return PersistentTabView(
          onTabChanged: (v) {
            value.changeTab(v);
          },
          controller: value.navBarController,
          backgroundColor: white,
          tabs: [
            PersistentTabConfig(
              screen: const HomeScreen(),
              item: ItemConfig(
                textStyle: TextStyle(height: 0, fontSize: 13),
                activeForegroundColor: buttonColor2,
                title: 'Home',
                inactiveIcon: SvgPicture.asset(ImageApp.home),
                icon: SvgPicture.asset(ImageApp.homeActive),
              ),
            ),
            PersistentTabConfig(
              screen: const CategoryScreen(),
              item: ItemConfig(
                textStyle: TextStyle(height: 0, fontSize: 13),
                activeForegroundColor: buttonColor2,
                title: 'Category',
                inactiveIcon: SvgPicture.asset(ImageApp.category),
                icon: SvgPicture.asset(ImageApp.categoryActive),
              ),
            ),
            PersistentTabConfig(
              screen: const CartScreen(),
              item: ItemConfig(
                textStyle: TextStyle(height: 0, fontSize: 13),
                activeForegroundColor: buttonColor2,
                title: 'Cart',
                inactiveIcon: SvgPicture.asset(ImageApp.cart),
                icon: SvgPicture.asset(ImageApp.cartActive),
              ),
            ),
            PersistentTabConfig(
              screen: const ProfileScreen(),
              item: ItemConfig(
                textStyle: TextStyle(height: 0, fontSize: 13),
                activeForegroundColor: buttonColor2,
                title: 'Profile',
                inactiveIcon: SvgPicture.asset(ImageApp.profile),
                icon: SvgPicture.asset(ImageApp.profileActive),
              ),
            ),
          ],
          navBarBuilder:
              (navBarConfig) => Style6BottomNavBar(
                navBarDecoration: NavBarDecoration(),
                navBarConfig: navBarConfig,
              ),
        );
      },
    );
  }
}
