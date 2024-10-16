import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/brandtitle.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';
import 'package:hardware_store/widgets/iconbutton_widget.dart';

class ProductCardVerticalWidget extends StatelessWidget {
  final String image;
  final String discount;
  final String brand;
  final String price;
  final String productname;
  final Function onWishlistPressed;
   final VoidCallback onTap; 

  const ProductCardVerticalWidget(
      {super.key,
      this.productname = 'Hammer',
      this.image = 'assets/images/categories/handtools.png',
      this.brand = 'stanley',
      this.price = 'Rs.2500',
      this.discount = '30%',
      required this.onTap,
      required this.onWishlistPressed});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isDarkMode ? Colors.grey : HColors.light,
        ),
        child: Column(
          children: [
            CircularContainer(
              height: 180,
              radius: 12,
              backgroundColor: isDarkMode ? Colors.grey : HColors.light,
              child: Stack(
                children: [
                  // image
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: image.startsWith('http') // Check if image is a URL
                          ? Image.network(
                              image,
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  image, // Fallback image
                                  fit: BoxFit.contain,
                                  width: MediaQuery.of(context).size.width,
                                );
                              },
                            )
                          : Image.asset(
                              image, // Load from assets if it's not a URL
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width,
                            ),
                    ),

                  ),
                  // sales tag
                  Positioned(
                    top: 8,
                    child: CircularContainer(
                      height: 20,
                      width: 40,
                      radius: 5,
                      backgroundColor: HColors.primary.withOpacity(0.8),
                      margin: const EdgeInsets.all(3),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      child: Text(
                        discount,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: HColors.light),
                      ),
                    ),
                  ),
                  // favourite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButtonWidget(
                      icon: FontAwesomeIcons.solidHeart,
                      color: Colors.red,
                      onPressed: () => onWishlistPressed(
                        productname,
                        brand,
                        price,
                        image,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            // details
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productname,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 2),
                  BrandTitle(
                    title: brand,
                    mainAxisSize: MainAxisSize.max,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // price
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: HColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: const SizedBox(
                    width: 30,
                    height: 30,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: HColors.light,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
