import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/controller/login_controller.dart';
import 'package:hardware_store/screens/signup.dart';
import 'package:hardware_store/widgets/button_widget.dart';
import 'package:hardware_store/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {
  // to handle the login
  final AuthController authController = Get.put(AuthController());
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
   bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                 Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10.0),
                const Text("Enter Your Credentials To Login "),
                const SizedBox(height: 30.0),
                textBox(
                  context: context,
                  hintText: "Username",
                  icon: FontAwesomeIcons.userLarge,
                  controller: userName,
                  isObs: false,
                  keyboardType: TextInputType.text,
                ),
                textBox(
                  context: context,
                  hintText: "Password",
                  icon: FontAwesomeIcons.solidEyeSlash,
                  controller: password,
                  isObs: true, // to hide the text
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        const Text("Remember me"),
                      ],
                    ),      
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                buttonMain(
                  onPressed: () {
                    authController.login(
                      userName.text,
                      password.text,
                      
                    );
                  },
                    text: 'Sign In',
                    color: Colors.white,
                    boxcolor: HColors.primary),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: HColors.secondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or sign in with",
                          style: Theme.of(context).textTheme.bodyLarge,
                          
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    socialicons('assets/images/google.png'),
                    socialicons('assets/images/apple.png'),
                    socialicons('assets/images/facebook.png'),
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: HColors.primary,
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// social icons
  Container socialicons(image) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2),
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
      height: 60,
      width: 70,
      child: MaterialButton(
        onPressed: () {},
      ),
    );
  }
}
