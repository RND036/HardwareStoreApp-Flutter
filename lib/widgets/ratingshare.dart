import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingSharewidget extends StatelessWidget {
  const RatingSharewidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //rating
        Row(
          children: [
            const Icon(
              FontAwesomeIcons.star,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: '5.0',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const TextSpan(text: ' (199)')
            ]))
          ],
        ),
        // share button 
        IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.shareNodes,size: 24,),)
      ],
    );
  }
}