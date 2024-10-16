import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/brandcard_widget.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';

class BrandShowcaseWidget extends StatelessWidget {
  const BrandShowcaseWidget({
    super.key,
    required this.isDarkMode,
    required this.images, required this.brandimage, required this.brandtitle, required this.brandsubtitle,
  });

  final bool isDarkMode;
  final String brandimage;
  final String brandtitle;
  final String brandsubtitle;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
        showborder: true,
        radius: 20,
        bordercolor: Colors.grey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //brands with product count
            BrandCardWidget(isDarkMode: isDarkMode, showborder: false,image:brandimage ,title:brandtitle ,subtitle: brandsubtitle,),
            const SizedBox(height: 8,),

            //top product images
            Row(
                children:
                    // to map the images
                    images
                        .map((image) =>
                            BrandTopProductImageWidget(image, context))
                        .toList())
          ],
        ));
  }
}

Widget BrandTopProductImageWidget(String image, context) {
  final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Expanded(
    child: CircularContainer(
      height: 100,
      radius: 20,
      backgroundColor: isDarkMode ? Colors.grey : Colors.transparent,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(0),
      child: Image(image: AssetImage(image)),
    ),
  );
}
