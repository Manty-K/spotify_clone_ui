import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/colored_tab_bar.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class PodcastTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AppBar(
        bottom: ColoredTabBar(
          AppColors.black,
          TabBar(
            indicatorColor: AppColors.green,
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            tabs: [
              Tab(
                icon: AppStyles.defaultText('Episodes'),
              ),
              Tab(
                icon: AppStyles.defaultText('Downloads'),
              ),
              Tab(
                icon: AppStyles.defaultText('Shows'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
