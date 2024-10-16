import 'package:flutter/material.dart';


class HAppBarTheme {

  HAppBarTheme._();

  // Light theme configuration for the AppBar.
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0, // No shadow below the AppBar.
    scrolledUnderElevation: 0, // No shadow when content is scrolled under the AppBar.
    centerTitle: false, 
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent, 
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24), // Actions icon color and size.
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600, 
      color: Colors.black
    
    ),
  );

  // Dark theme configuration for the AppBar.
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0, 
    centerTitle: false, 
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent, 
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600, 
      color: Colors.white
    ),
  );
}