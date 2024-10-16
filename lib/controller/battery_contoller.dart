import 'dart:async';

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';

class BatteryPercentageWidget extends StatefulWidget {
  const BatteryPercentageWidget({super.key});

  @override
  State<BatteryPercentageWidget> createState() => _BatteryPercentageWidgetState();
}

class _BatteryPercentageWidgetState extends State<BatteryPercentageWidget> {
  final battery = Battery();
  int percentage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    getBatteryPercentage();
  
  timer = Timer.periodic(const Duration(seconds: 10), (timer){
    getBatteryPercentage();
  });
  }

  void getBatteryPercentage() async {
    // get battery level
    final level = await battery.batteryLevel;
    
    // update UI with the battery percentage
    setState(() {
      percentage = level;
    });

    // show toast notifications based on the battery level
    if (percentage <= 20) {
      _showBatteryLowToast();
    } else if (percentage == 100) {
      _showBatteryFullToast();
    }
  }

  void _showBatteryLowToast() {
    DelightToastBar(
      builder: (context) {
        return const ToastCard(
          color: HColors.light,
          leading: Icon(
            FontAwesomeIcons.batteryEmpty,
            size: 34,
            color: Color.fromARGB(255, 236, 10, 10),
          ),
          title: Text(
            'Battery Level Low !! ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: HColors.dark,
            ),
          ),
          subtitle: Text(
            'Connect To Your Charger',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: HColors.dark,
            ),
        )
        );
      },
      position: DelightSnackbarPosition.top,
      autoDismiss: true,
      snackbarDuration: Durations.extralong4,
    ).show(context);
  }

  void _showBatteryFullToast() {
    DelightToastBar(
      builder: (context) {
        return const ToastCard(
          color: HColors.light,
          leading: Icon(
            FontAwesomeIcons.batteryFull,
            size: 34,
            color:HColors.primary,
          ),
          title: Text(
            'Battery Fully Charged !!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: HColors.dark,
            ),
            
          ),
          subtitle: Text(
            'Remove Your Charger',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: HColors.dark,
            ),
        ));
      },
      position: DelightSnackbarPosition.top,
      autoDismiss: true,
      snackbarDuration: Durations.extralong4,
    ).show(context);
  }
    @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
     return const SizedBox.shrink(); 
  }
}
