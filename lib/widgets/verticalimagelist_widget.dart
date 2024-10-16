// vertical image list

import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

class VerticalImageListWidget extends StatelessWidget {
  const VerticalImageListWidget({
    super.key,
    required this.imagePath,
    this.textcolor = HColors.light,
    this.backgroundColor=HColors.light,
    this.onTap,
    required this.title,
  });
  final String title;
  final String imagePath;
  final Color textcolor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            // circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
               
                ),
              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: SizedBox(
                  width: 55,
                  child: Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: textcolor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
            )
          ],
        ),
      ),
    );
  }
}