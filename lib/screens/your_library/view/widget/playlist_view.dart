import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/screens/your_library/model/user_prefs.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class PlaylistView extends StatelessWidget {
  UserPrefs userPrefs = UserPrefs();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.defaultPadding),
      child: ListView(
        padding: EdgeInsets.only(top: AppStyles.defaultPadding),
        children: [
          Container(
            height: 100,
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  color: AppColors.darkGrey,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: AppStyles.defaultPadding),
                AppStyles.defaultText('Create Playlist'),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purpleAccent,
                      Colors.white,
                    ],
                  )),
                ),
                SizedBox(width: AppStyles.defaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    AppStyles.defaultText('Liked Songs'),
                    AppStyles.greyText('2 songs'),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
          ...userPrefs.userPlaylists
        ],
      ),
    );
  }
}
