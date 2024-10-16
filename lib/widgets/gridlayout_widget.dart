import 'package:flutter/material.dart';

class GridLayoutWidget extends StatelessWidget {
  const GridLayoutWidget({
    super.key,
    required this.itemcount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemcount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemcount, // grid count
        shrinkWrap: true, // wrap only to grid count
        padding: EdgeInsets.zero,
        physics:
            const NeverScrollableScrollPhysics(), // prevent the child of this grid scroll
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: mainAxisExtent, /*size of a one child of grid*/
        ),
        itemBuilder: itemBuilder);
  }
}
