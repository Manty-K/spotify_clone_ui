import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class MusicAlbumTile extends StatelessWidget {
  final String albumName;
  final String imageUrl;
  final int noOfSongs;

  MusicAlbumTile(this.albumName, this.imageUrl, this.noOfSongs);

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
                image: DecorationImage(image: NetworkImage('$imageUrl'))),
          ),
          SizedBox(width: AppStyles.defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              AppStyles.defaultText('$albumName'),
              AppStyles.greyText('$noOfSongs songs'),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
