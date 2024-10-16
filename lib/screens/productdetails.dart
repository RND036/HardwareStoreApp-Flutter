import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/controller/cart_controller.dart';
import 'package:hardware_store/screens/cart.dart';
import 'package:hardware_store/screens/review.dart';
import 'package:hardware_store/widgets/bottomaddtocart.dart';
import 'package:hardware_store/widgets/button_widget.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/productdata_widget.dart';
import 'package:hardware_store/widgets/productimageslider.dart';
import 'package:hardware_store/widgets/ratingshare.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';
import 'package:hardware_store/widgets/userreviewcard.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String productBrand;
  final String productPrice;

   final CartController cartController = Get.find();
 
  
  final String productImage;
 
   ProductDetailScreen({super.key,
   required this.productName,
    required this.productBrand,
    required this.productPrice,
    required this.productImage,
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomAddToCart(onPressed: (){
         cartController.addToCart(
            productName,   // Pass product name
            productBrand,  // Pass brand name
            productPrice,  // Pass price
            productImage,  // Pass image path
          );
          Get.to(() => CartScreen()); // Navigate to CartScreen after adding
        
        
      },),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product image slider
             ProductImageSliderWidget(productImage: productImage,),

            // product details
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                children: [
                  const NetworkConnection(),
                  // rating & share button
                  const RatingSharewidget(),

                  // price ,title ,stack,brand
                   ProductDataWidget(
                    productName: productName,
                    productBrand: productBrand,
                    productPrice: productPrice,
                    
                    
                  ),
                  const SizedBox(height: 32,),

                  //checkout button
                  SizedBox(width:double.infinity ,child:  buttonMain(text: 'checkout',color: HColors.light,boxcolor: HColors.primary,onPressed: (){})),

                  //descrption
                  const SectionHeadingWidget(title: 'Description', showActionButton: false),
                  const SizedBox(height: 12,),
                  const ReadMoreText('this is the description for this image there a more descrption gonna come hang on adn also there a re more products decrptions to add  ',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  trimExpandedText: 'Less',),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: 12,),
                  SectionHeadingWidget(title: 'Reviews(199)', showActionButton: true,onPressed: ()=>Get.to(const ReviewScreen()),),
                  const UserReviewCard(
              username: 'Ravishka Dissanayaka',
              review:
                  'I\'ve been shopping at Tech Hardware Store for a few months now, and it\'s quickly become my go-to for all things DIY. The store has a wide selection of tools and building materials, making it easy to find everything I need for my projects. Their customer service is top-notch; the staff is always friendly and knowledgeable, ready to offer advice or help find a specific item. Prices are competitive, and they often have great deals. My only gripe is that the website could be a bit more user-friendly, but overall, it\'s a solid choice for any hardware needs!',
              reviewdate: '12 Apr 2024',
              rating: 3.4,
              feedbackdate: '13 Apr 2024',
              feedback:
                  'Thank you for your kind words and for choosing Tech Hardware Store as your preferred destination for DIY projects! We\'re thrilled to hear that you’ve had a positive experience with our wide selection of tools and building materials, and that our staff has been able to assist you effectively. We appreciate your feedback regarding our website and are currently working on improvements to make it more user-friendly. Your satisfaction is our priority, and we look forward to serving you again soon. If you ever need further assistance, please don’t hesitate to reach out!',
            ),
            const UserReviewCard(
              username: 'Nimali Perera',
              review:
                  'Tech Hardware Store has been a lifesaver for my home renovation project. The variety of products they offer is impressive, and I always find what I\'m looking for. The prices are reasonable, and the quality is top-notch. However, I wish the delivery service was a bit faster. Overall, I\'m happy with my experience!',
              reviewdate: '05 Mar 2024',
              rating: 4.5,
              feedbackdate: '06 Mar 2024',
              feedback:
                  'We\'re delighted to hear that our products have been helpful for your home renovation, Nimali! We understand your concerns about delivery speed, and we\'re working on improving it. Thank you for your feedback, and we hope to continue providing you with the best service possible.',
            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


