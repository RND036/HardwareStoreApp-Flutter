
import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

Widget textBox({
   required BuildContext context,
  required String hintText,
  required IconData icon,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyboardType,
}
  
){
  return Container(
    height: 70.0,
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    margin: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(color: HColors.secondary,
    borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            controller: controller, 
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 18.0, color: Color.fromARGB(255, 76, 76, 76)),
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 23, 23, 23),
            )),
            ),
        
       Icon(icon,
       color: const Color.fromARGB(255, 110, 109, 109),), 

      ],),
  );
}