import 'package:flutter/material.dart';
import 'package:veg_e_commerce/components/app_string.dart';
import 'package:veg_e_commerce/components/image_app.dart';

class BoardingProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _boardingList = [
    {
      "image": ImageApp.boardingBg,
      "text": StringApp.getYourVegetable,
      "description": StringApp.theBestDeliveryApp,
    },
    {
      "image": ImageApp.boardingBg1,
      "text": StringApp.weDelivered,
      "description": StringApp.theBestDeliveryApp,
    },
  ];
  final PageController _controller = PageController(initialPage: 0);

  int _count = 0;

  int get count => _count;

  List<Map<String, dynamic>> get boardingList => _boardingList;

  PageController get controller => _controller;

  set count(int value) {
    _count = value;
    notifyListeners();
  }
}
