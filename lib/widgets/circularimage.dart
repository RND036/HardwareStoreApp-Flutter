import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlaycolor,
    this.backgroundcolor,
    this.width = 56,
    this.height = 56,
    required this.padding,
    this.onPressed,
    required this.applyimageradius,
    required this.borderradius,
    this.border, 
     this.borderradiusmain = 100,
    
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final Color? backgroundcolor;
  final double width, height, padding;
  final VoidCallback? onPressed;
  final bool applyimageradius;
  final double borderradius;
  final BoxBorder? border;
  final double borderradiusmain;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            border: border,
            color:
                backgroundcolor ?? (isDarkMode ? HColors.dark : HColors.light),
            borderRadius: BorderRadius.circular(borderradiusmain),
          ),
          child: ClipRRect(
            borderRadius: applyimageradius
                ? BorderRadius.circular(borderradius)
                : BorderRadius.zero,
            child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider,
              color: overlaycolor,
            ),
          )),
    );
  }
}
