import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/screens/paymentsucess.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/cartitems.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: AppBarWidget(
          title: Text(
            'Checkout',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const NetworkConnection(),
                CartItems(
                  isDarkMode: isDarkMode,
                  showaddremovebutton: false, price: 'Rs.2000', image: 'assets/images/categories/handtools.png', name: 'Hammer', brand: 'stannley',
                ),
                const SizedBox(
                  height: 32,
                ),

                //coupon text field
                CouponCode(isDarkMode: isDarkMode),
                const SizedBox(
                  height: 32,
                ),
                // billing section
                CircularContainer(
                  padding: const EdgeInsets.all(24),
                  radius: 12,
                  showborder: true,
                  backgroundColor: isDarkMode ? HColors.dark : HColors.light,
                  child: Column(
                    children: [
                      // pricing
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SubTotal',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Rs.1000',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          // shipping fee
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping Fee',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Rs.250',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order Total',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Rs.1000',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Divider(),
                      //billing address
                      Column(
                        children: [
                          SectionHeadingWidget(
                            title: 'Payment Method',
                            showActionButton: true,
                            buttontitle: 'Change',
                            onPressed: () {},
                          ),
                          Row(
                            children: [
                              CircularContainer(
                                width: 60,
                                height: 35,
                                backgroundColor:
                                    isDarkMode ? HColors.dark : HColors.light,
                                padding: const EdgeInsets.all(8),
                                child: const Icon(FontAwesomeIcons.creditCard),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Credit Card',
                                style: Theme.of(context).textTheme.bodyLarge,
                              )
                            ],
                          )
                        ],
                      ),
                      // address section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeadingWidget(
                            title: 'Shipping Address',
                            buttontitle: 'change',
                            onPressed: () {},
                            showActionButton: true,
                          ),
                          Text(
                            'Ravishka Dissanayaka',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.grey,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                '+94 78 182 7743',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.mapLocation,
                                color: Colors.grey,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Bogala Road,Kannaththota,Ruwanwella',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(const PaymentSucessScreen()),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: HColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    child: const Text(
                      'Checkout Rs.2500',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 18.0,
                      ),
                    )))));
  }
}

// coupon code
class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      radius: 12,
      showborder: true,
      backgroundColor: isDarkMode ? HColors.dark : HColors.light,
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
      child: Row(
        children: [
          // text field
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a Promo Code? Enter Here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          // button
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: HColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18.0,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
