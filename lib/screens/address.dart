import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/controller/address_controller.dart';
import 'package:hardware_store/screens/addnewaddress.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/shimmer.dart';
import 'package:hardware_store/widgets/singleaddressbar.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final AddressController controller = Get.put(AddressController());
  bool isLoading = false; // To track loading state

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
    });

    await controller.loadAddress(); // Load new data
    // Simulate a delay for the shimmer effect
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const AddNewAddressScreen()),
        backgroundColor: HColors.primary,
        child: const Icon(
          FontAwesomeIcons.plus,
          color: HColors.light,
        ),
      ),
      appBar: AppBarWidget(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(() {
          return isLoading
              ? const ShimmerBuilder()
              : ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                     const NetworkConnection(),
                    SingleAddressBar(
                      selectedaddress: true,
                      name: controller.name.value,
                      address: controller.address.value,
                      number: controller.number.value,
                    ),
                  ],
                );
                
        }),
      ),
    );
  }

}