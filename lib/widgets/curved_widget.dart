import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/shapes/customcurvededges.dart';

class CustomCurvedWidget extends StatelessWidget {
  const CustomCurvedWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: Customcurvededges(), // custom widget
        child: child);
  }
}