import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // to stack the elements
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(FontAwesomeIcons.cartShopping),
          color: iconColor,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text('2',
                  style: Theme.of(context).textTheme.labelLarge!.apply( // using apply to modify text !-used bcz label will be null but we think it not null
                      color: const Color.fromARGB(255, 255, 255, 255), 
                      fontSizeFactor: 0.7)),
            ),
          ),
        )
      ],
    );
  }
}
