import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/widgets/navigation_menu.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs; // To track loading state
  var isLoggedIn = false.obs; // To track login state
  var token = ''.obs; // To hold the token after login

  // Function for user login
  Future<void> login(String email, String password) async {
    isLoading(true); // Show loading indicator
    const url = 'https://tech.4gbxsolutions.com/api/auth/login';

    try {
      // send post request to login endpoint
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          // user providing informations
          'email': email,
          'password': password,
        }),
      );
      // checking response state
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        token.value = data['token']; // Save the token in memory
        isLoggedIn(true); // Update the login status

        Get.snackbar('sucess', 'Login Sucessfull',
            icon: const Icon(
              FontAwesomeIcons.circleCheck,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 5, 88, 5),
            colorText: Colors.white);

        Get.to(const NavigationMenu());
      } else {
        Get.snackbar('Error', 'Invalid Login Credentials',
            icon: const Icon(
              FontAwesomeIcons.circleXmark,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 213, 28, 3),
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed To Log In',
          messageText: Text('Check Your Internet Connection And Try Again!'),
          icon: const Icon(
            FontAwesomeIcons.circleXmark,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 213, 28, 3),
          colorText: Colors.white);
    } finally {
      isLoading(false); // Hide loading indicator
    }
  }

  // Function for user signup
  Future<void> signup(
      String name,
      String email,
      String password,
      String confirmpassword,
      String phonenumber,
      String address,
      String dob) async {
    isLoading(true);
    const url = 'https://tech.4gbxsolutions.com/api/auth/register';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmpassword': confirmpassword,
          'phone': phonenumber,
          'address': address,
          'dob': dob,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Signup Sucessful', 'Account Created',
            icon: const Icon(
              FontAwesomeIcons.circleCheck,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 5, 88, 5),
            colorText: Colors.white);
        Get.to(const NavigationMenu());
      } else {
        Get.snackbar('Error', 'Account Not Created Try Again Using Different Credentials',
            icon: const Icon(
              FontAwesomeIcons.circleXmark,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(255, 213, 28, 3),
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed To Log In',
          messageText: Text('Check Your Internet Connection And Try Again!'),
          icon: const Icon(
            FontAwesomeIcons.circleXmark,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 213, 28, 3),
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  // Function to logout
  void logout() {
    token.value = ''; // Clear the token
    isLoggedIn(false); // Set the login status to false
    Get.snackbar('Logout', 'You have logged out',
        icon: const Icon(
          FontAwesomeIcons.rightFromBracket,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 213, 28, 3),
        colorText: Colors.white);
  }
}
