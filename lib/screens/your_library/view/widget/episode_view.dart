import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/screens/your_library/model/user_prefs.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class EpisodeView extends StatelessWidget {
  final UserPrefs userPrefs = UserPrefs();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.defaultPadding),
      child: ListView(
        padding: EdgeInsets.only(top: AppStyles.defaultPadding),
        children: userPrefs.favEpisodes.map((e) => e).toList(),
      ),
    );
  }
}
