import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/screen_controller.dart';

class ActualSearchScreen extends StatelessWidget {
  final ScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              controller.searchButtonClicked.value = false;
              controller.setIndex(1);
            },
            child: Icon(Icons.chevron_left)),
      ),
      body: Center(
        child: Text('Actual Search Screen'),
      ),
    );
  }
}
