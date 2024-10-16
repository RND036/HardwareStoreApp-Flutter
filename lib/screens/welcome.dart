import 'package:flutter/material.dart';
import 'package:hardware_store/screens/login.dart';
import 'package:hardware_store/screens/signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme; // Access the current theme's TextTheme
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark; // Check if dark mode is enabled

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(// this is used to make sure that other componets(status bar) not affect to child elements
          child: Container(
            width: double.infinity, // make big as parent allows
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Image.asset('assets/images/Tech.png')),
                       const SizedBox(
                        height: 10),// to add space between the texts
                        Text("Your Trusted Source For Quality Hardware Snd Tools. Let's Build Something Great Together!",
                        textAlign: TextAlign.center,
                        style:theme.bodyLarge,
                        ),
                        const SizedBox(
                        height: 10),
                        Text("Just A Few More Steps To Go!!",
                        textAlign: TextAlign.center,
                         style:theme.bodyLarge,),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,// divide screen in to 3 parts and get one
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/welcome.png')),
                  ),
                ),
                Column(
                  children: <Widget>[
                    //login button
                    MaterialButton(
                      minWidth:double.infinity,
                      height: 60,
                       onPressed:(){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const LoginScreen()));
                       },
                       color: const Color(0xff008000),//0xFF opacity(alpha) value
                       //define the shape 
                       shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                       ),
                       child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        )
                      ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       MaterialButton(
                      minWidth:double.infinity,
                      height: 60,
                       onPressed:(){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const SignupScreen()));
                       },
                       //define the shape 
                       shape: RoundedRectangleBorder(
                        side:  BorderSide(
                          color: isDarkMode ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 0, 0, 0),),
                          borderRadius: BorderRadius.circular(50),
                       ),
                       child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )
                      ),
                      ),
        
              ]
              )
                
                
              ],
            )
             ,)),
      ),
    );
  }
}