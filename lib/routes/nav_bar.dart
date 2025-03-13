import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';
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
                inactiveIcon: SvgPicture.asset(ImageApp.home, color: gray),
                icon: SvgPicture.asset(ImageApp.home, color: buttonColor2),
              ),
            ),
            PersistentTabConfig(
              screen: const CategoryScreen(),
              item: ItemConfig(
                inactiveIcon: SvgPicture.asset(ImageApp.category, color: gray),
                icon: SvgPicture.asset(ImageApp.category, color: buttonColor2),
              ),
            ),
            PersistentTabConfig(
              screen: const CartScreen(),
              item: ItemConfig(
                inactiveIcon: SvgPicture.asset(ImageApp.cart, color: gray),
                icon: SvgPicture.asset(ImageApp.cart, color: buttonColor2),
              ),
            ),
            PersistentTabConfig(
              screen: const ProfileScreen(),
              item: ItemConfig(
                inactiveIcon: SvgPicture.asset(ImageApp.profile, color: gray),
                icon: SvgPicture.asset(ImageApp.profile, color: buttonColor2),
              ),
            ),
          ],
          navBarBuilder:
              (navBarConfig) => Style3BottomNavBar(
                navBarDecoration: NavBarDecoration(),
                navBarConfig: navBarConfig,
              ),
        );
      },
    );
  }
}
