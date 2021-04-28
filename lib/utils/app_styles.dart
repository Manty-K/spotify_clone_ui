import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';

abstract class AppStyles {
  static double defaultPadding = 10;

  static Text titleText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  static Text titleTextDark(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white30, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  static Text defaultText(String text) => Text(text,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700));

  static Text greyText(String text) => Text(text,
      style:
          TextStyle(color: AppColors.lightGrey, fontWeight: FontWeight.w400));
}
