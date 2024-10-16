import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';
import 'package:hardware_store/widgets/curved_widget.dart';

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({
    super.key, 
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedWidget(
      child: Container(
        color: HColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(children: [
          //circular content changed the position
          Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                  backgroundColor: HColors.light.withOpacity(0.1))),
          Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                  backgroundColor: HColors.light.withOpacity(0.1))),
        
                  child,
        ]),
      ),
    );
  }
}


