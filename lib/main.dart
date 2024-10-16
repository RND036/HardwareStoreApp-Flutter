import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hardware_store/controller/cart_controller.dart';
import 'package:hardware_store/controller/darktheme_controller.dart';
import 'package:hardware_store/controller/wishlist_controller.dart';
import 'package:hardware_store/screens/splash.dart';
import 'package:provider/provider.dart';

void main() async{
  Get.put(WishlistController());
  Get.put(CartController());
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter engin is fully initialized before function
  await GetStorage.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      
    child:const  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // use getx functions
      themeMode: ThemeMode.system,
      title: 'Hardware Store',
      debugShowCheckedModeBanner: false,
      theme:Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreen(),
    );
  }
}

