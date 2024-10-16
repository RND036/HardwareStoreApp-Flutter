import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/brandtitle.dart';
import 'package:hardware_store/widgets/circularimage.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';
import 'package:hardware_store/widgets/productattributes.dart';

class ProductDataWidget extends StatelessWidget {
  final String productName;
  final String productBrand;
  final String productPrice;
 
  


  
 const ProductDataWidget({
    super.key,
    required this.productName,
    required this.productBrand,
    required this.productPrice,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // price & sale price
        Row(
          children: [
            // sale tag
            CircularContainer(
              radius: 12,
              backgroundColor: HColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 16,
            ),

            //price
            Text(
              '$productPrice',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '$productPrice',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        //title
        Text(
          productName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 8,
        ),

        // stock status
        Row(
          children: [
            Text(
              'Status',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(
          height: 8,
        ),
        // brand
         Row(
          children: [
            CircularImage(
              image:"assets/images/brands/stanleylogo.png",
              padding: 0,
              width: 50,
              height: 32,
              applyimageradius: false,
              borderradius: 5,
            ),
            SizedBox(
              width: 8,
            ),
            BrandTitle(title: 'Stanley'),

           
          ],
          
           
           
        ),
         // attributes
        const SizedBox(
              height: 8,
            ),
         const ProductAttributes()
      ],
    );
  }
}
