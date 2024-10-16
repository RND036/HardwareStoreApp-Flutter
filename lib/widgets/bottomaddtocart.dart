import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/iconbutton_widget.dart';

class BottomAddToCart extends StatelessWidget {
  final Function onPressed;

  BottomAddToCart({super.key,required this.onPressed});
  
 
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey.shade700 : Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const IconButtonWidget(
                icon: FontAwesomeIcons.minus,
                color: HColors.light,
                backgroundColor: Colors.grey,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: 16,
              ),
              const IconButtonWidget(
                icon: FontAwesomeIcons.plus,
                color: HColors.light,
                backgroundColor: Colors.black,
                width: 40,
                height: 40,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                onPressed();
                
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                backgroundColor: HColors.primary,
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                ),
              ),
              child: Text(
                'Add To Cart',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: HColors.light),
              ))
        ],
      ),
    );
  }
}
