import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class MusicArtistTile extends StatelessWidget {
  final String artistName;
  final String imageUrl;
  MusicArtistTile(this.artistName, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: AppColors.darkGrey,
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage('$imageUrl'))),
          ),
          SizedBox(width: AppStyles.defaultPadding),
          AppStyles.defaultText('$artistName'),
        ],
      ),
    );
  }
}
