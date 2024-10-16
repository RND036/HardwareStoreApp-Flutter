import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';

class SingleAddressBar extends StatelessWidget {
  const SingleAddressBar({
    super.key,
    required this.selectedaddress,
    this.name='ravishka',
    this.number='123',
    this.address='maththamagoda',
  });
  final bool selectedaddress;
  final String name;
  final String number;
  final String address;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return CircularContainer(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      radius: 12,
      showborder: true,
      backgroundColor: selectedaddress
          ? HColors.primary.withOpacity(0.5)
          : Colors.transparent,
      bordercolor: selectedaddress
          ? Colors.transparent
          : isDarkMode
              ? Colors.grey.shade500
              : Colors.grey,
      margin: const EdgeInsets.only(bottom: 12),
      child: Stack(
        children: [
          Positioned(
              right: 5,
              top: 0,
              child: Icon(
                selectedaddress ? FontAwesomeIcons.solidCircleCheck : null,
                color: selectedaddress
                    ? isDarkMode
                        ? HColors.light
                        : HColors.dark
                    : null,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                number,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                address,
                softWrap: true,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
