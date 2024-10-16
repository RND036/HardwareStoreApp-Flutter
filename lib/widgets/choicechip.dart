import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected, required String label,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label:  Text(text),
      backgroundColor: const Color.fromARGB(255, 65, 64, 64),
      selectedColor: HColors.primary,
      selected: selected,
      onSelected: onSelected,
      labelStyle:  TextStyle(color: selected ? HColors.light : null),
    );
  }
}
