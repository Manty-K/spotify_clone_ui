import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/screen_controller.dart';

class SearchBar extends StatelessWidget {
  final ScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // controller.searchButtonClicked.value = true;
              // controller.setIndex(1);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.search,
                      color: Colors.green[900],
                    ),
                  ),
                  Text(
                    'Artist, songs, or podcasts',
                    style: TextStyle(color: Colors.grey[900], fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.mic_none),
        ),
      ],
    );
  }
}
