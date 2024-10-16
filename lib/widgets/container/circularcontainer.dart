import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key, 
    this.width , 
    this.height , 
    this.radius = 400, 
    this.padding, 
    this.child, 
    this.backgroundColor,
    this.margin, 
    this.showborder= false,
    this.bordercolor=Colors.grey,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry ? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color ? backgroundColor;
  final bool showborder;
  final Color bordercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showborder ? Border.all(color: bordercolor):null,
      ),
      child: child,
    );
  }
}
