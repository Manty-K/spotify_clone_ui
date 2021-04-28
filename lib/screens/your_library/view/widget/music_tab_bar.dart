import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

import 'colored_tab_bar.dart';

class MusicTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AppBar(
        bottom: ColoredTabBar(
          AppColors.black,
          TabBar(
            labelColor: Colors.lightGreenAccent,
            indicatorColor: AppColors.green,
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            tabs: [
              Tab(
                icon: AppStyles.defaultText('Playlists'),
              ),
              Tab(
                icon: AppStyles.defaultText('Artists'),
              ),
              Tab(
                icon: AppStyles.defaultText('Albums'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
