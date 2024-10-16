import 'package:get/get.dart';

class CarouselController extends GetxController{
  static CarouselController get instance =>Get.find();

  final CarouselCurrentIndex = 0.obs; // pointing to the indexs

  void updatePageIndicator(index){
    CarouselCurrentIndex.value = index;
  }
}