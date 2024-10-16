import 'package:flutter/material.dart';
import 'package:hardware_store/Theme/colors.dart';

class TabbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabbarWidget({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: isDarkMode ? HColors.dark : HColors.light,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: HColors.primary,
        labelColor: isDarkMode ? HColors.light : HColors.dark,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); //ktoolbarheight is the standard height of the app bar
}
