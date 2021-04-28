import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/test_controller.dart';

class TestScreen extends StatelessWidget {
  final controller = TestController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text('${controller.countValue.value}')),
        // child: Text('lp'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.increase();
        },
      ),
    );
  }
}
