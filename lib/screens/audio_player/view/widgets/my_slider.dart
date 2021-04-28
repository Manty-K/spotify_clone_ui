import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/screens/audio_player/controller/audio_controller.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderThemeData(
            activeTrackColor: AppColors.light,
            inactiveTrackColor: AppColors.lightGrey,
            overlayColor: AppColors.light.withOpacity(0.2),
            thumbColor: AppColors.light,
            trackHeight: 2,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
        child: GetBuilder<AudioController>(
          builder: (controller) {
            return Slider(
              value: controller.sliderPosition.value,
              onChanged: (value) {
                controller.setSliderPosition(value);
              },
              onChangeEnd: (value) {
                controller.boom();
              },
              onChangeStart: (value) {
                controller.itsMoving();
              },
            );
          },
        ));
  }
}
