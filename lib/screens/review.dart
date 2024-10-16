import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/ratingprogressindicator.dart';
import 'package:hardware_store/widgets/userreviewcard.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: const AppBarWidget(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      //body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Ratings and Reviews are verified and from people who use the same type of service from us'),
            const SizedBox(
              height: 12,
            ),

            // overall product review
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      '4.8',
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
                const Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      NetworkConnection(),
                      RatingProgressIndicator(
                        text: '5',
                        value: 1.0,
                      ),
                      RatingProgressIndicator(
                        text: '4',
                        value: 0.8,
                      ),
                      RatingProgressIndicator(
                        text: '3',
                        value: 0.6,
                      ),
                      RatingProgressIndicator(
                        text: '2',
                        value: 0.4,
                      ),
                      RatingProgressIndicator(
                        text: '1',
                        value: 0.2,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const RatingsBar(
              rating: 3.5,
            ),
            Text(
              '12,611',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 32,
            ),

            // user reviews list
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

            const UserReviewCard(
              username: 'Kavindu Wijesinghe',
              review:
                  'I purchased several power tools from Tech Hardware Store, and I\'m extremely satisfied with their performance. The store offers a great range of options, and the staff was very helpful in guiding me to the right products. My only suggestion would be to expand the online catalog. Keep up the great work!',
              reviewdate: '15 May 2024',
              rating: 4.7,
              feedbackdate: '16 May 2024',
              feedback:
                  'Thank you, Kavindu, for your positive review! We\'re glad to hear that you\'re happy with your power tools and that our staff was able to assist you. We appreciate your suggestion regarding our online catalog and will consider expanding it to provide more options. Your feedback helps us improve!',
            ),

            const UserReviewCard(
              username: 'Sanduni Jayasinghe',
              review:
                  'Tech Hardware Store has a solid selection of paints and painting accessories. I was able to find exactly what I needed for my latest project. The staff was courteous and knowledgeable, which made my shopping experience enjoyable. I do wish they had more eco-friendly options, though. Overall, it\'s a good store!',
              reviewdate: '10 Feb 2024',
              rating: 4.2,
              feedbackdate: '11 Feb 2024',
              feedback:
                  'Thank you for your review, Sanduni! We\'re pleased that you found the paints and accessories you needed and that our staff provided excellent service. Your suggestion for more eco-friendly products is noted, and we\'re exploring ways to expand our offerings in that area. We appreciate your support!',
            ),

            const UserReviewCard(
              username: 'Dinuka Fernando',
              review:
                  'I had a mixed experience with Tech Hardware Store. While they have a great selection of tools, I found the pricing to be on the higher side compared to other stores. The staff was friendly, but the checkout process took longer than expected. I\'ll probably shop here again, but only during sales.',
              reviewdate: '22 Jun 2024',
              rating: 3.8,
              feedbackdate: '23 Jun 2024',
              feedback:
                  'Thank you, Dinuka, for your honest feedback. We\'re glad to hear that you appreciated our selection and customer service. We\'re continuously working on optimizing our pricing and checkout process to enhance the shopping experience. We hope to see you again during our sales!',
            ),

            const UserReviewCard(
              username: 'Sachini Gamage',
              review:
                  'Tech Hardware Store is my go-to place for garden supplies. They have a wide variety of products, and I love their seasonal discounts. The staff is always willing to help, and I\'ve never had any issues with my purchases. It would be great if they offered a loyalty program. Highly recommended!',
              reviewdate: '30 Jul 2024',
              rating: 4.9,
              feedbackdate: '31 Jul 2024',
              feedback:
                  'Thank you for your fantastic review, Sachini! We\'re thrilled that you enjoy shopping for garden supplies at our store and that our seasonal discounts have been helpful. We appreciate your suggestion regarding a loyalty program, and we\'re considering it for the future. Thank you for your continued support!',
            ),
          ],
        ),
      ),
    );
  }
}

// rating bar indicator

class RatingsBar extends StatelessWidget {
  const RatingsBar({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: Colors.grey.shade500,
        itemBuilder: (_, __) => const Icon(
              FontAwesomeIcons.solidStar,
              color: HColors.primary,
            ));
  }
}
