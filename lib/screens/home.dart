// home_screen.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/controller/cart_controller.dart';
import 'package:hardware_store/controller/wishlist_controller.dart';
import 'package:hardware_store/screens/allproducts.dart';
import 'package:hardware_store/screens/cart.dart';
import 'package:hardware_store/screens/productdetails.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/container/primaryheadercontainer.dart';
import 'package:hardware_store/widgets/counter_widget.dart';
import 'package:hardware_store/widgets/gridlayout_widget.dart';
import 'package:hardware_store/widgets/imagecarousel_widget.dart';
import 'package:hardware_store/widgets/jsonimport/categories.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/productcardvertical_widget.dart';
import 'package:hardware_store/widgets/searchbar_widget.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';
import 'package:hardware_store/widgets/shimmer.dart';
import 'package:hardware_store/widgets/verticalimagelist_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WishlistController wishlistController = Get.find();
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List<Categories>>(
          future: readJsonData(),
          builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.hasError) {
              return const Center(
                  child: Text('Error fetching data, please try again'));
            } else if (!data.hasData || data.data == null) {
              return const Center(child: Text('No data available'));
            } else {
              var categories = data.data!;
              return Column(
                children: [
                  NetworkConnection(),
                  PrimaryHeader(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(24),
                          child: CustomAppBar(),
                        ),
                        const SearchBarWidget(
                          text: 'Search In Tech.',
                          showBackground: true,
                          showBorder: true,
                          icon: FontAwesomeIcons.magnifyingGlass,
                        ),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Column(
                            children: [
                              const SectionHeadingWidget(
                                title: 'Trending Categories',
                                showActionButton: false,
                                textcolor: HColors.light,
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: categories.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return VerticalImageListWidget(
                                      imagePath:
                                          categories[index].image.toString(),
                                      title: categories[index].title,
                                      onTap: () {},
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const CarouselImages(
                          banners: [
                            "assets/images/banners/banner1.png",
                            "assets/images/banners/banner2.png",
                            "assets/images/banners/banner3.png",
                          ],
                        ),
                        const SizedBox(height: 16),
                        SectionHeadingWidget(
                          title: 'Popular Categories',
                          showActionButton: true,
                          textcolor: HColors.dark,
                          onPressed: () {
                            Get.to(AllProductsScreen());
                          },
                        ),
                        const SizedBox(height: 16),
                        FutureBuilder<List<Products>>(
                          future: readProductsJsonData(),
                          builder: (context, productData) {
                            if (productData.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: ShimmerBuilder());
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
                                itemcount: 6,
                                itemBuilder: (_, index) =>
                                    ProductCardVerticalWidget(
                                  image: products[index].image.toString(),
                                  productname: products[index].title,
                                  price: products[index].price,
                                  brand: products[index].brand,
                                  discount: products[index].discount, 
                                  onWishlistPressed: (name,brand,price,image){
                                    wishlistController.addToWishlist(name,brand,price,image);
                                  }, onTap: () { Get.to(() => ProductDetailScreen(
                                      productName: products[index].title,
                                      productBrand: products[index].brand,
                                      productPrice: products[index].price.toString(),
                                      productImage: products[index].image.toString(),
                                    )); },),
                                
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
          },
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome, Tech.",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: HColors.light,
              )),
          Text(
            "Ravishka Dissanayaka",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: HColors.light),
          )
        ],
      ),
      action: [
        CounterWidget(
          onPressed: () => Get.to( CartScreen(),
              transition: Transition.fade, duration: Duration(seconds: 1)),
          iconColor: HColors.light,
        )
      ],
    );
  }
}

// Separate the readJsonData and readProductsJsonData into methods below
Future<List<Categories>> readJsonData() async {
  final jsondata =
      await rootBundle.loadString('assets/json/trendingcategories.json');
  final Map<String, dynamic> decodedData = json.decode(jsondata);
  final List<dynamic> categoriesList = decodedData['Categories'];
  return categoriesList.map((data) => Categories.fromJson(data)).toList();
}

Future<List<Products>> readProductsJsonData() async {
  final jsondata =
      await rootBundle.loadString('assets/json/products.json');
  final Map<String, dynamic> decodedData = json.decode(jsondata);
  final List<dynamic> productsList = decodedData['Products'];
  return productsList.map((data) => Products.fromJson(data)).toList();
}
