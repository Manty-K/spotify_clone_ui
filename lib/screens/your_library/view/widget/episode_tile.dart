import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class EpisodeTile extends StatelessWidget {
  final String episodeName;
  final String imageUrl;
  final int minsLeft;

  EpisodeTile(this.episodeName, this.minsLeft, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppStyles.defaultPadding / 2),
      padding: EdgeInsets.only(left: 10),
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage('$imageUrl'))),
          ),
          SizedBox(width: AppStyles.defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              AppStyles.defaultText('$episodeName'),
              AppStyles.greyText('$minsLeft min left'),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
