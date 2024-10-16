import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
        // to add the progress indicator
                      
        Expanded(
          flex: 11,
    
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor:Colors.grey.shade500,
              valueColor:const AlwaysStoppedAnimation(HColors.primary) ,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}