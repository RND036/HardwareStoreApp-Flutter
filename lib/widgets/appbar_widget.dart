import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.action,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        0,
      ),
      child: AppBar(
        automaticallyImplyLeading: false, // disable automatic back button
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back() // to get back to previous screen
                ,
                icon: const Icon(FontAwesomeIcons.arrowLeft))
// if dont want a backbutton
            : leadingIcon != null
                ? IconButton(
                    onPressed:
                        leadingOnPressed // to get back to previous screen
                    ,
                    icon: Icon(leadingIcon))
                : null,
                
        title: title,
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); //ktoolbarheight is the standard height of the app bar
}
