
import 'package:flutter/material.dart';

class Customcurvededges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   var path = Path(); // to create the path of widget
   path.lineTo(0,size.height); // path start point   

// first curve
   final firstCurve= Offset(0, size.height-20); // first curve start point
   final lastCurve = Offset(30, size.height-20);// first curve end point moving the first corner to 30 in x-axis

   path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy); // to add the curve 

//middle line
   final secondFirstCurve= Offset(0, size.height-20);
   final secondLastCurve = Offset(size.width-30, size.height-20);

   path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,secondLastCurve.dx, secondLastCurve.dy);

//last curve
   final thirdFirstCurve= Offset(size.width, size.height-20);
   final thirdLastCurve = Offset(size.width, size.height);

   path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

   path.lineTo(size.width, 0);// path end point
   path.close();


   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }
  
}