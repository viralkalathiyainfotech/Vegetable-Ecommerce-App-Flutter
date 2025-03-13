import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavigationProvider with ChangeNotifier {
  final PersistentTabController _navBarController = PersistentTabController(initialIndex: 0);
  PersistentTabController get navBarController => _navBarController;


  void changeRoute(String newRoute,BuildContext context) {
    Navigator.pushNamed(context, newRoute);
  }

  void replaceRoute(BuildContext context, String newRoute) {
    Navigator.pushReplacementNamed(context, newRoute);
  }

  void clearAndNavigate(BuildContext context, String newRoute) {
    Navigator.pushNamedAndRemoveUntil(context, newRoute, (route) => false);
  }

  void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
  void changeTab(int index) {
    navBarController.jumpToTab(index);
    notifyListeners();
  }
}