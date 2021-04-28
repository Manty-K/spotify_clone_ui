import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class GreetingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppStyles.defaultPadding,
          vertical: AppStyles.defaultPadding),
      child: Row(
        children: [
          AppStyles.titleText('Good Evening'),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppStyles.defaultPadding),
            child: Icon(
              Icons.history,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppStyles.defaultPadding),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
