import 'package:flutter/material.dart';
import 'package:veg_e_commerce/model/product_model.dart';

import '../../components/app_string.dart';
import '../../components/image_app.dart';

class HomeProvider with ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  final List<Map<String, dynamic>> _topCategoriesList = [
    {"image": ImageApp.vegetables, "text": StringApp.vegetables},
    {"image": ImageApp.leafy, "text": StringApp.leafy},
    {"image": ImageApp.hydroponic, "text": StringApp.hydroponic},
    {"image": ImageApp.seasonal, "text": StringApp.seasonal},
    {"image": ImageApp.root, "text": StringApp.root},
    {"image": ImageApp.organic, "text": StringApp.organic},
  ];

  final List<ProductModel> _productList = [
    ProductModel(
      image: 'assets/images/tomato.png',
      title: 'Hybrid Tomato',
      weight: '500 g',
      price: '\$20',
      oldPrice: '\$25',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/onion.png',
      title: 'Onion',
      weight: '1 kg',
      price: '\$40',
      oldPrice: '\$50',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/potato.png',
      title: 'Potato',
      weight: '500 g',
      price: '\$15',
      oldPrice: '\$20',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/green_chili.png',
      title: 'Green Chili',
      weight: '200 g',
      price: '\$8',
      oldPrice: '\$15',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/cauliflower.png',
      title: 'Cauliflower',
      weight: '1 piece',
      price: '\$25',
      oldPrice: '\$40',
      discount: '25% OFF',
    ),
  ];

  final List<Map<String, dynamic>> _bannerList = [
    {
      "image": "assets/images/banner_1.png",
      "text": "Quality Veges at an\naffordable price",
      "subTitle": "Eat every day",
      "gradient": [Color(0xff3C3C3C), Color(0xff666666)],
    },
    {
      "image": "assets/images/banner_2.png",
      "text": "Delivery on\nyour doorstep",
      "subTitle": "Shop \$50 & get free delivery",
      "gradient": [Color(0xff67A080), Color(0xff4B5B19)],
    },
    {
      "image": "assets/images/banner_3.png",
      "text": "Natural Premium\nVegetables",
      "subTitle": "Save up to 40%",
      "gradient": [Color(0xff032D1B), Color(0xff6A8123)],
    },
  ];

  final List<ProductModel> _seasonalList = [
    ProductModel(
      image: 'assets/images/carrot.png',
      title: 'Carrot',
      weight: '500 g',
      price: '\$20',
      oldPrice: '\$25',
      discount: '',
    ),
    ProductModel(
      image: 'assets/images/broccoli.png',
      title: 'Broccoli',
      weight: '250 g',
      price: '\$35',
      oldPrice: '\$50',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/green_capsicum.png',
      title: 'Green Capsicum',
      weight: '500 g',
      price: '\$50',
      oldPrice: '\$65',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/green_peas.png',
      title: 'Green Peas',
      weight: '250 g',
      price: '\$15',
      oldPrice: '\$25',
      discount: '',
    ),
    ProductModel(
      image: 'assets/images/radish.png',
      title: 'Radish (Moolangi)',
      weight: '500-600 g',
      price: '\$45',
      oldPrice: '\$60',
      discount: '',
    ),
  ];
  final List<ProductModel> _gridProductList = [
    ProductModel(
      image: 'assets/images/coriander_leaves.png',
      title: 'Coriander Leaves',
      weight: '100 g',
      price: '\$15',
      oldPrice: '\$30',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/broccoli.png',
      title: 'Broccoli',
      weight: '200 g',
      price: '\$35',
      oldPrice: '\$50',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/lemon.png',
      title: 'Lemon',
      weight: '200 g',
      price: '\$60',
      oldPrice: '\$100',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/ginger.png',
      title: 'Ginger',
      weight: '250 g',
      price: '\$30',
      oldPrice: '\$40',
      discount: '20% OFF',
    ),
    ProductModel(
      image: 'assets/images/radish.png',
      title: 'Radish (Moolangi)',
      weight: '500-600 g',
      price: '\$45',
      oldPrice: '\$60',
      discount: '',
    ),
  ];

  List<Map<String, dynamic>> get topCategoriesList => _topCategoriesList;

  List<Map<String, dynamic>> get bannerList => _bannerList;

  List<ProductModel> get productList => _productList;

  List<ProductModel> get seasonalList => _seasonalList;

  List<ProductModel> get gridProductList => _gridProductList;

  TextEditingController get searchController => _searchController;

  FocusNode get searchFocus => _searchFocus;
}
