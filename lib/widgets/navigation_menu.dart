import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/screens/home.dart';
import 'package:hardware_store/screens/settings.dart';
import 'package:hardware_store/screens/store.dart';
import 'package:hardware_store/screens/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            color: Colors.white, // Background color of the container
            child: GNav(
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (index) => controller.selectedIndex.value = index,
              backgroundColor: Colors.transparent, // Set background to transparent
              color: Colors.black, // Color of the icons
              activeColor: HColors.primary, // Color of the active icon
              iconSize: 24, // Size of the icons
              gap: 8, // Gap between icon and label
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              tabBorderRadius: 15,
              curve: Curves.easeOutExpo,
              tabs: const [
                GButton(
                  icon: FontAwesomeIcons.house,
                  text: 'Home',
                ),
                GButton(
                  icon: FontAwesomeIcons.shop,
                  text: 'Store',
                ),
                GButton(
                  icon: FontAwesomeIcons.heart,
                  text: 'Wishlist',
                ),
                GButton(
                  icon: FontAwesomeIcons.user,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs; // To observe the selected index

  final List<Widget> screens = [
    const HomeScreen(),
    const StoreScreen(),
     WishListScreen(),
    const SettingsScreen(),
  ];
}
