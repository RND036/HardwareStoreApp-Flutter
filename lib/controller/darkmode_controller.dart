// controllers/theme_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  // Storage key for the theme mode
  final _storage = GetStorage();
  final _key = 'isDarkMode';

  // Observable for dark mode
  var isDarkMode = false.obs;

  // Initialize the theme state from storage or default to system mode
  ThemeController() {
    isDarkMode.value = _storage.read(_key) ?? false; // Default to false if no value is stored
    // Apply theme mode accordingly
    Get.changeThemeMode(
        isDarkMode.value ? ThemeMode.dark : ThemeMode.system);
  }

  // Toggle theme mode
  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    _storage.write(_key, value); // Persist user's choice
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  // Handle system mode
  void useSystemTheme(bool useSystem) {
    if (useSystem) {
      Get.changeThemeMode(ThemeMode.system);
    } else {
      toggleDarkMode(isDarkMode.value);
    }
  }
}
