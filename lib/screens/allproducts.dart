import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hardware_store/controller/wishlist_controller.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/gridlayout_widget.dart';
import 'package:hardware_store/widgets/productcardvertical_widget.dart';

Future<List<dynamic>> fetchProducts() async {
  final response = await http.get(Uri.parse(
      'https://tech.4gbxsolutions.com/api/product')); // API to get products 

  if (response.statusCode == 200) {
    try {
      final data = json.decode(response.body);
      print('API Response: $data'); // Print the API response
      return data;
    } catch (e) {
      throw Exception('Failed to parse products data: $e');
    }
  } else {
    throw Exception(
        'Failed to load products. Status code: ${response.statusCode}, Response: ${response.body}');
  }
}

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  late Future<List<dynamic>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts(); // Fetch products when the page loads
  }

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.find();
    return Scaffold(
      appBar: AppBarWidget(
        title: Text('All Products'),
        showBackArrow: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _productsFuture, // Use the Future for loading data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Show loading spinner
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Failed to load products: ${snapshot.error}')); // Handle errors
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('No products found')); // Handle empty data
          }

          // Render the grid with product data
          final products = snapshot.data!;

          return GridLayoutWidget(
              itemcount: products.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCardVerticalWidget(
                      image: products[index]['product'] != null &&
                              products[index]['product'].startsWith('http')
                          ? products[index]['product']
                          : 'https://tech.4gbxsolutions.com/storage/${products[index]['product']}',
                      productname: products[index]['name'] ?? '',
                      price: products[index]['selling price'] ?? '',
                      brand: products[index]['brand'] ?? 'Stanley',
                      onWishlistPressed: (name, brand, price, image) {
                        wishlistController.addToWishlist(
                            name, brand, price, image);
                      }, onTap: () {  },
                    ),
              ));
        },
      ),
    );
  }
}
