import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/screens/review.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    required this.username,
    required this.review,
    required this.reviewdate,
    required this.rating,
    required this.feedbackdate,
    required this.feedback,
  });
  final String username;
  final String review;
  final String reviewdate;
  final double rating;
  final String feedbackdate;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/man.png'),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  username,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.ellipsisVertical))
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        //review
        Row(
          children: [
            RatingsBar(rating: rating),
            const SizedBox(
              width: 12,
            ),
            Text(
              reviewdate,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ReadMoreText(
          review,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? HColors.light : HColors.dark),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? HColors.light : HColors.dark),
        ),
        const SizedBox(
          height: 16,
        ),
        // comapny review
        CircularContainer(
          backgroundColor:
              isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
          radius: 12,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tech.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      feedbackdate,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ReadMoreText(
                  feedback,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? HColors.light : HColors.dark),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? HColors.light : HColors.dark),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
