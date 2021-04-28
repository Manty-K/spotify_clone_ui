import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/screens/home/model/sections.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

import 'widets/greeting_bar.dart';
import 'widets/homescreen_section.dart';
import 'widets/recent_played_tracks_widget.dart';

class HomeScreen extends StatelessWidget {
  Sections sections = Sections();
  final double defaultPadding = 10.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                AppColors.black,
              ],
              stops: [
                0.0,
                0.3,
              ],
            ),
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingBar(),
              RecentPlayedTracksWidget(),
              HomeScreenSection('Your top shows', sections.topShows),
              HomeScreenSection('Jump back in', sections.jumpBackIn),
              HomeScreenSection('Recent listening', sections.recentListening),
              HomeScreenSection(
                  'Recommended for today', sections.recommendedForToday),
              SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ]),
    );
  }
}
