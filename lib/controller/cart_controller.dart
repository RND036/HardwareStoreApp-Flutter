import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartController extends GetxController {
  var cart = <Map<String, String>>[].obs; // Reactive list for cart items

  void addToCart(String productName, String productBrand, String productPrice, String productImage) {
   
    bool alreadyInCart = cart.any((item) => item['name'] == productName);

    if (!alreadyInCart) {
      cart.add({
        'name': productName,
        'brand': productBrand,
        'price': productPrice,
        'image': productImage,
      });

      Get.snackbar(
        'Added to Cart',
        '$productName has been added to your Cart',
        icon: const Icon(
          FontAwesomeIcons.circleCheck,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 5, 88, 5),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Already in Cart',
        '$productName is already in your cart',
        icon: const Icon(
          FontAwesomeIcons.circleExclamation,
          color: Colors.white,
        ),
        backgroundColor: Colors.orangeAccent,
        colorText: Colors.white,
      );
    }
    
  }

  void removeFromCart(String name) {
    cart.removeWhere((item) => item['name'] == name);
    Get.snackbar(
      'Removed from Cart',
      '$name has been removed from your cart',
      icon: const Icon(
        FontAwesomeIcons.circleXmark,
        color: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 213, 28, 3),
      colorText: Colors.white,
    );
  }
    // Function to calculate the total price
  double get totalPrice {
  return cart.fold(0.0, (sum, item) {
    // Convert price from string to double and handle potential invalid numbers
    double price = double.tryParse(item['price'] ?? '0') ?? 0;
 
    return sum + price;
  });

}
}
    
  


