import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/controller/battery_contoller.dart';
import 'package:hardware_store/controller/darktheme_controller.dart';
import 'package:hardware_store/screens/address.dart';
import 'package:hardware_store/screens/location.dart';
import 'package:hardware_store/screens/login.dart';
import 'package:hardware_store/screens/orderslist.dart';
import 'package:hardware_store/screens/privacypolicies.dart';
import 'package:hardware_store/screens/productvalidate.dart';
import 'package:hardware_store/screens/profile.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/button_widget.dart';
import 'package:hardware_store/widgets/circularimage.dart';
import 'package:hardware_store/widgets/container/primaryheadercontainer.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';
import 'package:hardware_store/widgets/settingsmenu.dart';
import 'package:provider/provider.dart';
import 'package:hardware_store/controller/login_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BatteryPercentageWidget(),
            const NetworkConnection(),
            // header
            PrimaryHeader(
                child: Column(
              children: [
                // app bar
                AppBarWidget(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: Colors.white),
                  ),
                ),

                // user profile card
                ListTile(
                  leading: const CircularImage(
                    image: 'assets/images/man.png',
                    applyimageradius: false,
                    borderradius: 0,
                    padding: 0,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    'Ravishka Dissanayaka',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.white),
                  ),
                  subtitle: Text(
                    'ravishkanimsara20@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.white),
                  ),
                  trailing: IconButton(
                      onPressed: () => Get.to(() => const ProfileScreen()),
                      icon: const Icon(
                        FontAwesomeIcons.penToSquare,
                        color: HColors.light,
                      )),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            )),
            // body
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SectionHeadingWidget(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(
                    height: 16,
                  ),
                  SettingsMenuTiles(
                    icon: FontAwesomeIcons.house,
                    title: 'My Address',
                    subtitle: 'set shopping delivery address',
                    ontap: () => Get.to(const AddressScreen()),
                  ),
                  SettingsMenuTiles(
                    icon: FontAwesomeIcons.cartShopping,
                    title: 'My Cart',
                    subtitle: 'Add,Remove Products/move to Checkout',
                    ontap: () {},
                  ),
                  SettingsMenuTiles(
                    icon: FontAwesomeIcons.bagShopping,
                    title: 'My Orders',
                    subtitle: 'In progress and completed orders',
                    ontap: () => Get.to(const OrdersListScreen()),
                  ),
                  SettingsMenuTiles(
                    icon: FontAwesomeIcons.ticket,
                    title: 'My Coupons',
                    subtitle: 'List of all discount coupons',
                    ontap: () {},
                  ),
                  SettingsMenuTiles(
                    icon: FontAwesomeIcons.solidCircleCheck,
                    title: 'Validator',
                    subtitle: 'Validate your product',
                    ontap: () {
                      Get.to(const ProductValidateScreen());
                    },
                  ),
                  SettingsMenuTiles(
                    icon: FontAwesomeIcons.shield,
                    title: 'Privacy Policies',
                    subtitle: 'View Privacy Policies and More ',
                    ontap: () {
                      Get.to(const PrivacyPolicyScreen());
                    },
                  ),
                  SettingsMenuTiles(
                    icon: FontAwesomeIcons.mapLocation,
                    title: 'Find Us',
                    subtitle: 'Find the location of the store',
                    ontap: () => Get.to(const LocationScreen()),
                  ),

                  // app settings

                  const SizedBox(
                    height: 12,
                  ),
                  const SectionHeadingWidget(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(
                    height: 12,
                  ),

                  SettingsMenuTiles(
                      icon: FontAwesomeIcons.locationCrosshairs,
                      title: 'Geolocation',
                      subtitle: 'set recomandation based on your location',
                      trailing: Switch(value: false, onChanged: (value) {})),
                  SettingsMenuTiles(
                      icon: FontAwesomeIcons.moon,
                      title: 'Darkmode',
                      subtitle: 'switch to dark mode',
                      trailing: Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value; // Update the switch state
                            });
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme();
                          })),
                  const SizedBox(
                    height: 12,
                  ),
                  // logout button
                  buttonMain(
                      text: 'Logout',
                      color: Colors.white,
                      boxcolor: Colors.red,
                      onPressed: () {
                        AuthController().logout();
                        Get.to(const LoginScreen());
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
