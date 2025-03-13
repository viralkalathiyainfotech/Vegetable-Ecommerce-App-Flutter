import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veg_e_commerce/routes/app_routes.dart';
import 'package:veg_e_commerce/screen/auth/login/login_provider.dart';
import 'package:veg_e_commerce/screen/auth/register/register_provider.dart';
import 'package:veg_e_commerce/screen/boarding/boarding_provider.dart';
import 'package:veg_e_commerce/screen/cart/cart_provider.dart';
import 'package:veg_e_commerce/screen/category/category_providerl.dart';
import 'package:veg_e_commerce/screen/home/home_provider.dart';
import 'package:veg_e_commerce/screen/profile/profile_provider.dart';
import 'package:veg_e_commerce/utils/shared_preferences_provider.dart';
import 'components/color.dart';
import 'routes/navigation.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => SharePreferenceProvider()),
        ChangeNotifierProvider(create: (_) => BoardingProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MyApp(),
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: black,
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vegetable E Commerce",
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: '/',
    );
  }
}

//Provider.of<NavigationProvider>(context, listen: false)
//                   .changeRoute('/screenOne', context);
