// carousel images

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/controller/carousel_controller.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';

class CarouselImages extends StatelessWidget {
  const CarouselImages({
    super.key,
    required this.banners,
  });
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarouselController()); // calling functions
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0, // Adjust the height as needed
            viewportFraction: 0.8, // Adjust the viewport fraction for side visibility
            onPageChanged: (index, _) => controller.updatePageIndicator(index), // calling page indicator function
            autoPlay: true, // enable auto rotation
            autoPlayInterval: const Duration(seconds: 3), // interval between slides
            autoPlayAnimationDuration: const Duration(milliseconds: 800), // animation duration
            autoPlayCurve: Curves.fastOutSlowIn, // animation curve
            enlargeCenterPage: true, // enlarge the center image
          ),
          items: banners.map((url) => ImageCarousel(imagePath: url)).toList(), // to get the banners to list
        ),
        const SizedBox(height: 8),
        Obx(
          // observer for page change
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // loop for repetition
              for (int i = 0; i < banners.length; i++)
                CircularContainer(
                  width: 20,
                  height: 4,
                  backgroundColor: controller.CarouselCurrentIndex.value == i
                      ? HColors.primary
                      : Colors.grey, // to change the color of the container
                  margin: const EdgeInsets.only(right: 10),
                ),
            ],
          ),
        )
      ],
    );
  }
}

// image carousel

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    super.key,
    this.imagePath='assets/images/categories/handtools.png',
    this.onPressed,
  });
  final String imagePath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0), // use same radius for smooth edges
          child: Image(
            image: AssetImage(imagePath),
            fit: BoxFit.cover, // to fill the image in container
            width: MediaQuery.of(context).size.width, // full width
          ),
        )
    );
  }
}
