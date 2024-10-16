//section heading widget
import 'package:flutter/material.dart';

class SectionHeadingWidget extends StatelessWidget {
  const SectionHeadingWidget({
    super.key,
    required this.title,
    this.buttontitle = 'View All',
    this.textcolor,
    required this.showActionButton,
    this.onPressed,
  });

  final String title, buttontitle;
  final Color? textcolor;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textcolor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // this show .... when text overflow
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttontitle))
      ],
    );
  }
}
