import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class MusicPlaylistTile extends StatelessWidget {
  final String playlistName;
  final String imageUrl;
  final String createdBy;

  const MusicPlaylistTile(this.playlistName, this.imageUrl, this.createdBy);

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
              AppStyles.defaultText('$playlistName'),
              AppStyles.greyText('by $createdBy'),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
