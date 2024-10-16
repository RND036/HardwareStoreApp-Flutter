import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';

// search bar

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.text,
    this.icon=FontAwesomeIcons.magnifyingGlass,
    required this.showBackground,
    required this.showBorder,
    this.onTap, 
    this.padding=const EdgeInsets.symmetric(horizontal: 24),
  });
  final VoidCallback? onTap; // return no value
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry  padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // to get the full width of the screen
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: showBackground ? HColors.secondary : Colors.transparent,
              borderRadius: showBorder ? BorderRadius.circular(16) : null,
              border: Border.all(color: HColors.secondary)),
          child: Row(children: [
            Icon(
              icon,
              color: HColors.labelPrimary,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: HColors.labelPrimary)),
          ]),
        ),
      ),
    );
  }
}
