import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';

class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: const AppBarWidget(
          title: Text('Orders'),
          showBackArrow: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (_, __) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (_, index) => CircularContainer(
                padding: const EdgeInsets.all(8),
                radius: 12,
                showborder: true,
                backgroundColor: isDarkMode ? HColors.dark : HColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        // icon
                        const Icon(FontAwesomeIcons.ship),
                        const SizedBox(
                          width: 12,
                        ),
                        //status and date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Processing',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(
                                        color: isDarkMode
                                            ? HColors.light
                                            : HColors.dark,
                                        fontWeightDelta: 1),
                              ),
                              Text(
                                '07 Apr 2024',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // 2 row
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              // icon
                              const Icon(FontAwesomeIcons.truckFast),
                              const SizedBox(
                                width: 12,
                              ),
                              //status and date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: isDarkMode
                                                  ? HColors.light
                                                  : HColors.dark,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(
                                      'T00541',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              // icon
                              const Icon(FontAwesomeIcons.calendar),
                              const SizedBox(
                                width: 12,
                              ),
                              //status and date
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(
                                              color: isDarkMode
                                                  ? HColors.light
                                                  : HColors.dark,
                                              fontWeightDelta: 1),
                                    ),
                                    Text(
                                      '20 Apr 2024',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
