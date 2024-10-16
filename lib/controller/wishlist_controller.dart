import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlist = <Map<String, String>>[].obs; // Reactive list to store wishlist items

  void addToWishlist(String name, String brand, String price, String image) {
    wishlist.add({
      'name': name,
      'brand': brand,
      'price': price,
      'image': image,
    });
    Get.snackbar('Added to Wishlist', '$name has been added to your wishlist',
     icon: Icon(
              FontAwesomeIcons.circleCheck,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 5, 88, 5),
            colorText: Colors.white);
  }

  void removeFromWishlist(String name) {
    wishlist.removeWhere((item) => item['name'] == name);
    Get.snackbar('Removed from Wishlist', '$name has been removed from your wishlist',
    icon: Icon(
              FontAwesomeIcons.circleXmark,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 213, 28, 3),
            colorText: Colors.white);
  }
}
