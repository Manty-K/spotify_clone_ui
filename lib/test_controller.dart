import 'package:get/get.dart';

class TestController extends GetxController {
  var countValue = 0.obs;

  void increase() {
    countValue.value++;
  }
}
