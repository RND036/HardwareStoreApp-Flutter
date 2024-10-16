import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/navigation_menu.dart';
import 'package:lottie/lottie.dart'; 

class PaymentSucessScreen extends StatelessWidget {
  const PaymentSucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate height for orientaion for the lottie
    double lottieHeight = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.height * 0.4 
        : MediaQuery.of(context).size.height * 0.6; 

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: lottieHeight,
                child: Lottie.asset('assets/Lottie/sucessanimation.json'),
              ), 
              Text(
                'Payment Successful',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 12),
              Text(
                'Your payment has been successful! \n Item will be dispatched soon',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(const NavigationMenu()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue Shopping',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
