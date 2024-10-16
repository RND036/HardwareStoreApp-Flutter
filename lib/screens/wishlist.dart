import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/controller/wishlist_controller.dart';
import 'package:hardware_store/screens/home.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/gridlayout_widget.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/productcardvertical_widget.dart';


class WishListScreen extends StatelessWidget {
  final WishlistController wishlistController = Get.find();

   WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          IconButton(
              onPressed: () => Get.to(const HomeScreen()),
              icon: const Icon(FontAwesomeIcons.plus)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const NetworkConnection(),
              Obx(() {
                if (wishlistController.wishlist.isEmpty) {
                  return Center(
                    child: Text(
                      'No items in the wishlist',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                } else {
                  return GridLayoutWidget(
                    itemcount: wishlistController.wishlist.length,
                    itemBuilder: (_, index) {
                      var item = wishlistController.wishlist[index];
                      return ProductCardVerticalWidget(
                        image: item['image'] ?? '',
                        productname: item['name'] ?? '',
                        price: item['price'] ?? '',
                        brand: item['brand'] ?? '',
                        onWishlistPressed: (productname, brand, price, image ) {
                          wishlistController.removeFromWishlist(productname);
                        }, onTap: () {  },
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
