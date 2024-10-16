import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/circularimage.dart';
import 'package:hardware_store/widgets/curved_widget.dart';

class ProductImageSliderWidget extends StatelessWidget {
  final productImage;
  const ProductImageSliderWidget({
     required this.productImage,
    super.key,
  
  });


  @override
  Widget build(BuildContext context) {
     final bool isDarkMode=Theme.of(context).brightness == Brightness.dark;
    return CustomCurvedWidget(
      child: Container(
        color: isDarkMode ? Colors.grey : HColors.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                      child: Image.asset(
                          productImage)),
                )),
            // image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: 24,
    
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_,__)=>const SizedBox(width: 12,),
                  itemCount: 6,
                  itemBuilder: (_,index)=>CircularImage(
                    image: productImage,
                    border: Border.all(color: HColors.primary),
                    borderradiusmain: 12,
                    width: 80,
                    backgroundcolor:
                        isDarkMode ? HColors.dark : HColors.light,
                    padding: 8,
                    applyimageradius: true,
                    borderradius: 12,
                  ),
                ),
              ),
            ),
    
            // app bar icons 
            AppBarWidget(
              showBackArrow: true ,
              action: [
                IconButton(
              onPressed: () =>Get.to(()=>Get.back()),
              icon: const Icon(
                FontAwesomeIcons.solidHeart,
                color: Colors.red,
              )),
                
              ],
            )
    
          ],
        ),
      ),
    );
  }
}