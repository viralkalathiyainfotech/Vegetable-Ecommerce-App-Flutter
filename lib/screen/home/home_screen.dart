import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:veg_e_commerce/components/color.dart';
import 'package:veg_e_commerce/components/image_app.dart';
import 'package:veg_e_commerce/screen/home/home_provider.dart';

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
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: white,
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, home, child) {
          return SafeArea(
            child: Column(
              children: [
                Stack(children: [Image.asset(ImageApp.background)]),
              ],
            ),
          );
        },
      ),
    );
  }
}
