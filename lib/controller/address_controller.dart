import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddressController extends GetxController {
  final GetStorage box = GetStorage();

  var name = ''.obs;
  var address = ''.obs;
  var number = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadAddress();
    ever(name, (_) => updateAddress()); // Update address whenever name changes
    ever(address, (_) => updateAddress()); // Update address whenever address changes
    ever(number, (_) => updateAddress()); // Update address whenever number changes
  }

   loadAddress() {
    name.value = box.read('namekey') ?? '';
    address.value = '${box.read('streetkey') ?? ''} ${box.read('citykey') ?? ''} ${box.read('statekey') ?? ''}';
    number.value = box.read('phonekey') ?? '';
  }

  void updateAddress() {
    address.value = '${box.read('streetkey') ?? ''} ${box.read('citykey') ?? ''} ${box.read('statekey') ?? ''}';
  }
}
