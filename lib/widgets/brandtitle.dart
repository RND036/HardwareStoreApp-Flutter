import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

class BrandTitle extends StatelessWidget {
  const BrandTitle({
    super.key,
    required this.title,
    this.maxLines=1,
    this.textcolor,
    this.iconcolor,
    this.textAlign,
    this.brandicon=Icons.verified_rounded,
    this.mainAxisSize = MainAxisSize.min, 
    this.textStyle,
  });

  final String title;
  final int maxLines;
  final Color? textcolor, iconcolor;
  final TextAlign? textAlign;
  final IconData? brandicon;
  final MainAxisSize mainAxisSize;
  final TextStyle ? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisSize: mainAxisSize,// how the length of the main axis should be 
      children: [
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            textAlign: textAlign,
            style: textStyle ?? Theme.of(context).textTheme.labelMedium,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
         Icon(
          brandicon,
          color: HColors.primary,
          size: 16,
        )
      ],
    );
  }
}
