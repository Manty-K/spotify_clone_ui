import 'package:flutter/material.dart';

class Track {
  String trackName;
  String artistName;
  int imageID;
  String imageURL;
  String songURL;
  Color color;

  Track(this.trackName, this.artistName, this.imageID, this.songURL, this.color,
      {this.imageURL}) {
    if (imageURL == null) {
      imageURL = 'https://picsum.photos/id/$imageID/200';
    }
  }
}
