import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryPageController extends GetxController
    with SingleGetTickerProviderMixin {
  var controller = PageController().obs;
  Rx<TabController> tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0).obs;

    super.onInit();
  }

  void jumpToPodcast() {
    controller.value.jumpToPage(1);
  }

  void jumpToMusic() {
    controller.value.jumpToPage(0);
  }
}
