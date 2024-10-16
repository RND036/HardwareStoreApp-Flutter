import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

// icon button
class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.width,
    this.height,
    required this.icon,
    this.color,
    this.onPressed,
    this.backgroundColor,
    this.size,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor != null
              ? backgroundColor!
              : isDarkMode
                  ? Colors.grey
                  : HColors.light,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color, size: size),
        ));
  }
}
