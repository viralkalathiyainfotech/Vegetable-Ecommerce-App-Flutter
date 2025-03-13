import 'package:flutter/material.dart';

import '../../components/app_string.dart';
import '../../components/image_app.dart';

class HomeProvider with ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  TextEditingController get searchController => _searchController;

  FocusNode get searchFocus => _searchFocus;
  final List<Map<String, dynamic>> _topCategoriesList = [
    {"image": ImageApp.vegetables, "text": StringApp.vegetables},
    {"image": ImageApp.leafy, "text": StringApp.leafy},
    {"image": ImageApp.hydroponic, "text": StringApp.hydroponic},
    {"image": ImageApp.seasonal, "text": StringApp.seasonal},
    {"image": ImageApp.root, "text": StringApp.root},
    {"image": ImageApp.organic, "text": StringApp.organic},
  ];

  List<Map<String, dynamic>> get topCategoriesList => _topCategoriesList;
}
