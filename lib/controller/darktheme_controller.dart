import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/theme.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = AppTheme.lightTheme;


  ThemeData get themeData => _themeData;

  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == AppTheme.lightTheme){
      themeData = AppTheme.darkTheme;
    }
    else{
      themeData = AppTheme.lightTheme;
    }
  }

}