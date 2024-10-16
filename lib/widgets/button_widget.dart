import 'package:flutter/material.dart';

Widget buttonMain({
  required String text,
  Color? color,
  Color? boxcolor,
  VoidCallback ? onPressed,
  

}) {
    return Container(
      height: 70.0, // same as text field height
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: double.infinity, // matches the container's height
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: color,
          ),
        ),
      ),
    );
  }

