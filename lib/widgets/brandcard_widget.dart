import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/brandtitle.dart';
import 'package:hardware_store/widgets/circularimage.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';

class BrandCardWidget extends StatelessWidget {
  const BrandCardWidget({
    super.key,
    required this.isDarkMode,
    required this.showborder,
    this.onTap,
    this.image='assets/images/categories/handtools.png',
    this.title='Stanley',
    this.subtitle='256 products',
  });

  final bool isDarkMode;
  final bool showborder;
  final void Function()? onTap;
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircularContainer(
        padding: const EdgeInsets.all(12),
        backgroundColor: Colors.transparent,
        showborder: showborder,
        radius: 12,
        child: Row(
          children: [
            // icon
            Flexible(
              child: CircularImage(
                applyimageradius: false,
                borderradius: 0,
                image: image,
                padding: 0,
                fit: BoxFit.contain,
                backgroundcolor: Colors.transparent,
               
              ),
            ),
            const SizedBox(width: 16),

            // text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitle(
                    title:title ,
                    textcolor: Colors.black,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
