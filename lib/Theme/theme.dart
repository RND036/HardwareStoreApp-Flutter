import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/appbar_theme.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/Theme/text_theme.dart';

class AppTheme{
  AppTheme._();

 // light theme

  static ThemeData lightTheme =ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: HColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: HTexttheme.lightTextTheme , // text theme  
    appBarTheme: HAppBarTheme.lightAppBarTheme

  );  

  //dark theme 

  static ThemeData darkTheme =ThemeData(
     useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor:HColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: HTexttheme.darkTextTheme,
    appBarTheme: HAppBarTheme.darkAppBarTheme
  );
}