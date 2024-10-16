import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBuilder extends StatelessWidget {
  const ShimmerBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 6, 
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Row(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100, // Added width for the Container
                  color: Colors.white,
                ),
                const SizedBox(width: 10), // Added spacing between the Row children
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align the children to start
                  children: [
                    Container(
                      height: 10,
                      width: 200, // Set width for each Container
                      color: Colors.white,
                    ),
                    const SizedBox(height: 5), // Add space between containers
                    Container(
                      height: 10,
                      width: 100,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 5), 
                    Container(
                      height: 10,
                      width: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
