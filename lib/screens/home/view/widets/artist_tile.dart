import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

class ArtistTile extends StatelessWidget {
  final String title;
  final int imageID;

  ArtistTile(this.title, this.imageID);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/id/$imageID/200'),
                  fit: BoxFit.contain)),
        ),
        SizedBox(height: 5),
        AppStyles.defaultText('$title'),
      ],
    );
  }
}
