import 'package:flutter/material.dart';
import 'package:hardware_store/screens/cart.dart';

class CartItems extends StatelessWidget {
   CartItems({
    super.key,
    required this.isDarkMode,  this.showaddremovebutton = true, required this.price, required this.image, required this.name, required this.brand,
  });

  final bool isDarkMode;
  final bool  showaddremovebutton;
  final String price;
  final String image;
  final String name;
  final String brand;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
              height: 32,
            ),
        itemCount: 1,
        itemBuilder: (_, index) => Column(
              children: [
                 CartItem(image: image, brand: brand, name: name,),
                if(showaddremovebutton) const SizedBox(
                  height: 16,
                ),
                if(showaddremovebutton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 70,
                        ),
                        // add remove button
                        QuantityAddRemove(isDarkMode: isDarkMode, productName: name,),
                      ],
                    ),
                    Text(
                      '$price',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    
                  ],
                  
                ),
                SizedBox(height: 20,)
              ],
            ));
  }
}