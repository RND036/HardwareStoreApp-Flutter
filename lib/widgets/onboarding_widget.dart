import 'package:flutter/material.dart';
import 'package:hardware_store/screens/welcome.dart';
import 'package:lottie/lottie.dart';


class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,

    //calling them
    required this.color,
    required this.title,
    required this.description,
    required this.skip,
    required this.lottie,
    required this.onTab,
    required this.onSkip, 
    required this.index,
  });
  

  // make the things want to change
  final String color;   //string ? means not required 
  final String title;
  final String description;
  final bool skip;
  final String lottie;
  final VoidCallback onTab;
  final VoidCallback onSkip; 
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme; // Access the current theme's TextTheme
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark; // Check if dark mode is enabled

    return ColoredBox(
      color: hexToColor(color),
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.86,
              // Display Lottie animation
              child: Lottie.asset(lottie),
           
          ),

          // container positions with the title and para 
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.16,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.black : Colors.white,
                
                borderRadius: BorderRadius.only(
                  topLeft: index == 0 ? const Radius.circular(100) : const Radius.circular(0),
                  topRight: index == 2 ? const Radius.circular(100) : const Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  children: [
                    const SizedBox(height: 62,),
                    Text(
                      title, // using the above variables 
                      style: theme.headlineMedium,
                      textAlign: TextAlign.center,
                      
                    ),
                    const SizedBox(height: 16,),
                    Text(
                      description, 
                      style: theme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // button positions 
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              // skip button 
              child: skip
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: onSkip,
                        child:  Text('Skip Now', style:theme.labelSmall),
                      ),
                      GestureDetector(
                        onTap: onTab,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: hexToColor(color),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(Icons.arrow_circle_right, color: Colors.white, size: 42),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    height: 46,
                    // start button 
                    
                    child: MaterialButton(
                      color: hexToColor(color),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      onPressed: () {
                        // to go to login page 
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Welcome(),
                            ),
                          );
                      },
                      child: const Text('Get Started', style: TextStyle(color: Colors.white)),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// use hexa colors

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));
  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
