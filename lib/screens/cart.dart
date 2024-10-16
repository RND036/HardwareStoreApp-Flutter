import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/controller/cart_controller.dart';
import 'package:hardware_store/screens/checkout.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/brandtitle.dart';
import 'package:hardware_store/widgets/cartitems.dart';
import 'package:hardware_store/widgets/iconbutton_widget.dart';
import 'package:hardware_store/widgets/networkconnection.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();
   CartScreen({super.key});
 

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: AppBarWidget(
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: cartController.cart.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartController.cart[index];
                    return CartItems(
                      image: cartItem['image'] ?? '',
                      brand: cartItem['brand'] ?? '',
                      name: cartItem['name'] ?? '', isDarkMode: isDarkMode,
                      price: cartItem['price'] ?? '0',
                      
                    );
                  },
                );
              }),
            ),
            const NetworkConnection(),
          ],
        ),
      ),
        
        // checkout button
        bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SizedBox(
                width: double.infinity,
                
                child: ElevatedButton(
                    onPressed: () => Get.to(const CheckoutScreen(),transition: Transition.rightToLeft),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: HColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    child:  Obx(() {
          
              return Text(
                'Checkout Rs.${cartController.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 18.0,
                ),
              );
            }
                      
                    ))))
                    );
                    
  }
}

// quantity add remove
class QuantityAddRemove extends StatelessWidget {
   QuantityAddRemove({
    super.key,
    required this.isDarkMode, required this.productName,
  });

  final bool isDarkMode;
   final String productName;
  final CartController cartController = Get.find();
  
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButtonWidget(
          size: 15,
          onPressed: ( ) {
            cartController.removeFromCart(productName);
          },
          icon: FontAwesomeIcons.minus,
          height: 32,
          width: 32,
          color: isDarkMode ? HColors.light : HColors.dark,
          backgroundColor:
              isDarkMode ? Colors.grey.shade800 : Colors.grey.shade400,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          '1',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: 16,
        ),
        IconButtonWidget(
            size: 15,
            onPressed: () {},
            icon: FontAwesomeIcons.plus,
            height: 32,
            width: 32,
            color: HColors.light,
            backgroundColor: HColors.primary),
      ],
    );
  }
}

// cart items
class CartItem extends StatelessWidget {
  final String image;
    final String brand;
    final String name;
  const CartItem({
    super.key, required this.image, required this.brand, required this.name,
    
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
         Image(
          image: AssetImage(image),
          height: 60,
          width: 60,
        ),
        const SizedBox(
          width: 16,
        ),
        // title price size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               BrandTitle(title: brand),
              Flexible(
                  child: Text(
                name,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              )),

              // attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Size :',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: ' M', style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
