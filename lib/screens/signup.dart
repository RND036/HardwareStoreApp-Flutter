import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/controller/login_controller.dart';
import 'package:hardware_store/screens/login.dart';
import 'package:hardware_store/widgets/button_widget.dart';
import 'package:hardware_store/widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController dob = TextEditingController();
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
                  "Create Your Account",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10.0),
                const Text("Please Fill In The Forms To Continue "),
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
                  hintText: "Email",
                  icon: FontAwesomeIcons.envelope,
                  controller: email,
                  
                  keyboardType: TextInputType.text,
                ),
                textBox(
                  context: context,
                  hintText: "Password",
                  isObs: true, // to hide the text
                  icon: FontAwesomeIcons.solidEyeSlash,
                  controller: password,
             
                  keyboardType: TextInputType.text,
                ),
                textBox(
                  context: context,
                  hintText: "Confirm Password",
                  isObs: true, // to hide the text
                  icon: FontAwesomeIcons.solidEyeSlash,
                  controller: confirmpassword,
               
                  keyboardType: TextInputType.text,
                ),
                textBox(
                  context: context,
                  hintText: "Phone Number",
                  icon: FontAwesomeIcons.phone,
                  controller: phonenumber,
                 
                  keyboardType: TextInputType.number,
                ),
                textBox(
                  context: context,
                  hintText: "Address",
                  icon: FontAwesomeIcons.addressBook,
                  controller: address,
                  
                  keyboardType: TextInputType.text,
                ),
                textBox(
                  context: context,
                  hintText: "Date Of Birth",
                  icon: FontAwesomeIcons.calendarWeek,
                  controller: dob,
                  
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'I agree to the ',
                                style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff008000),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle the Terms and Conditions tap
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                buttonMain(
                  text: 'Sign Up',
                  color: Colors.white,
                  boxcolor: const Color(0xff008000),
                  onPressed: () {
                    authController.signup(
                        userName.text,email.text, password.text, confirmpassword.text,phonenumber.text,address.text,dob.text);
                  },
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or sign up with",
                            style: Theme.of(context).textTheme.bodyLarge),
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
                                builder: (context) => const LoginScreen()));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Already have an account? ',
                                style: Theme.of(context).textTheme.bodyLarge),
                            const TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff008000),
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
