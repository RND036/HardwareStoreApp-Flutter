import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hardware_store/screens/onboarding.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 
    SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: LottieBuilder.asset(
              "assets/Lottie/tech.json"),
          )
        ],
      ),
    )
    , nextScreen: const Onboarding(),
     pageTransitionType: PageTransitionType.fade, 
    splashIconSize: 400,
    duration: 2000,
    splashTransition: SplashTransition.fadeTransition, 
    backgroundColor: const Color.fromARGB(255, 27, 128, 30),);
  }
}