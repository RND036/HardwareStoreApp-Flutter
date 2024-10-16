import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    super.key,
    required this.title,
    this.maxlines = 2,
    this.textAlign = TextAlign.left,
    this.smallsize =false ,
  });

  final String title;
  final int maxlines;
  final TextAlign? textAlign;
  final bool smallsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallsize ? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      textAlign: textAlign,
    );
  }
}
