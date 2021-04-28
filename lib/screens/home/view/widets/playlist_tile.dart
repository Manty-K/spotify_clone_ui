import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class PlaylistTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final int imageID;

  PlaylistTile(this.title, this.subTitle, this.imageID);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.transparent,
          height: 200,
          width: 200,
          child: Image.network('https://picsum.photos/id/$imageID/200'),
        ),
        SizedBox(height: 5),
        AppStyles.defaultText('$title'),
        AppStyles.greyText('$subTitle')
      ],
    );
  }
}
