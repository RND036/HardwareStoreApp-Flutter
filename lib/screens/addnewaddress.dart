import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/button_widget.dart';
import 'package:hardware_store/widgets/constants/constant.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/textfield_widget.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final phone = TextEditingController();
    final street = TextEditingController();
    final postalcode = TextEditingController();
    final city = TextEditingController();
    final state = TextEditingController();
    return Scaffold(
      appBar: const AppBarWidget(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6),

          // add form to new addresss
          child: Form(
              child: Column(
            children: [
               const NetworkConnection(),
              textBox(
                hintText: 'Name',
                icon: FontAwesomeIcons.user,
                controller: name,
                context: context,
              ),
              textBox(
                  hintText: 'Phone Number',
                  icon: FontAwesomeIcons.phone,
                  controller: phone,
                  context: context,
                  keyboardType: TextInputType.phone),
              Row(
                children: [
                  Expanded(
                      child: textBox(
                          hintText: 'Street',
                          icon: FontAwesomeIcons.streetView,
                          controller: street,
                          context: context)),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: textBox(
                        hintText: 'Postal Code',
                        icon: FontAwesomeIcons.envelopesBulk,
                        controller: postalcode,
                        context: context,
                        keyboardType: TextInputType.number),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: textBox(
                          hintText: 'City',
                          icon: FontAwesomeIcons.building,
                          controller: city,
                          context: context)),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      child: textBox(
                          hintText: 'State',
                          icon: FontAwesomeIcons.route,
                          controller: state,
                          context: context,
                          keyboardType: TextInputType.text)),
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: buttonMain(
                      onPressed: () {
                        box.write('namekey', name.text);
                        box.write('phonekey', phone.text);
                        box.write('streetkey', street.text);
                        box.write('codekey', postalcode.text);
                        box.write('citykey', city.text);
                        box.write('statekey', state.text);

                        DelightToastBar(
                                builder: (context) {
                                  return const ToastCard(
                                      color: HColors.primary,
                                      leading: Icon(
                                        FontAwesomeIcons.solidBell,
                                        size: 34,
                                        color: HColors.light,
                                      ),
                                      title: Text(
                                        'Saved Sucessfully',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: HColors.light),
                                      ));
                                },
                                position: DelightSnackbarPosition.top,
                                autoDismiss: true,
                                snackbarDuration: Durations.extralong4)
                            .show(context);
                      },
                      text: 'Save',
                      color: HColors.light,
                      boxcolor: HColors.primary)
                      )
            ],
          )),
        ),
      ),
    );
  }
}
