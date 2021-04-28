import 'package:get/get.dart';

class ScreenController extends GetxController {
  var currentIndex = 0.obs;
  var searchButtonClicked = false.obs;
  void setIndex(int value) {
    currentIndex.value = value;
    print('Index Set to ${currentIndex.value}');
    update();
  }
}
