import 'package:flutter/material.dart';
import 'package:hardware_store/screens/home.dart';
import 'package:hardware_store/widgets/brandshowcase_widget.dart';
import 'package:hardware_store/widgets/gridlayout_widget.dart';
import 'package:hardware_store/widgets/jsonimport/categories.dart';
import 'package:hardware_store/widgets/productcardvertical_widget.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.isDarkMode, required this.image1, required this.image2, required this.image3, required this.image4, required this.image5, required this.image6, required this.brandimage, required this.brandtitle, required this.brandsubtitle,
  });

  final bool isDarkMode;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String image6;
  final String brandimage;
  final String brandtitle;
  final String brandsubtitle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // to stop scrolling
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              // brands
              BrandShowcaseWidget(
                isDarkMode: isDarkMode,
                images:  [
                  image1,
                  image2,
                  image3
                ], brandimage: brandimage, brandtitle: brandtitle, brandsubtitle: brandsubtitle,
              ),
               const SizedBox(
                height: 12,
              ),
              BrandShowcaseWidget(
                isDarkMode: isDarkMode,
                images:  [
                  image4,
                  image5,
                  image6
                ],brandimage: brandimage, brandtitle: brandtitle, brandsubtitle: brandsubtitle
                
              ),
              const SizedBox(
                height: 12,
              ),

              //products

              SectionHeadingWidget(
                title: 'You Might Like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12,
              ),

              FutureBuilder<List<Products>>(
                          future: readProductsJsonData(),
                          builder: (context, productData) {
                            if (productData.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (productData.hasError) {
                              return const Center(
                                  child: Text(
                                      'Error fetching products, please try again'));
                            } else if (!productData.hasData ||
                                productData.data == null) {
                              return const Center(
                                  child: Text('No products available'));
                            } else {
                              var products = productData.data!;
                              return GridLayoutWidget(
                                itemcount: products.length,
                                itemBuilder: (_, index) =>
                                    ProductCardVerticalWidget(
                                  image: products[index].image.toString(),
                                  productname: products[index].title,
                                  price: products[index].price,
                                  brand: products[index].brand,
                                  discount: products[index].discount, onWishlistPressed:(){}, onTap: () {  },
                                ),
                              );
                            }
                          },
                        )
            ],
          ),
        ),
      ],
    );
  }
}
