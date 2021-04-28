import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

import 'playlist_tile.dart';

class HomeScreenSection extends StatelessWidget {
  final List<Widget> widgetList;
  final String sectionName;
  const HomeScreenSection(this.sectionName, this.widgetList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppStyles.defaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: AppStyles.defaultPadding,
                bottom: AppStyles.defaultPadding),
            child: AppStyles.titleText('$sectionName'),
          ),
          Container(
            height: 250,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return;
              },
              child: ListView.separated(
                physics: RangeMaintainingScrollPhysics(),
                padding:
                    EdgeInsets.symmetric(horizontal: AppStyles.defaultPadding),
                itemCount: widgetList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return widgetList[index];
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: AppStyles.defaultPadding,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
