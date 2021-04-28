import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/song_model.dart';

class Playlist {
  static List<Track> list = [
    Track(
      'Holy Ghost',
      'Messinian',
      1069,
      'https://github.com/Manty-K/Sample_Music/blob/master/Messinian%20-%20Holy%20Ghost%20(Helicopter%20Showdown%20and%20Sluggo%20Dubstep%20Remix)%20%5BHD%5D.mp3?raw=true',
      Colors.pink,
      imageURL:
          'https://raw.githubusercontent.com/Manty-K/Sample_Music/master/holy_ghost.jpg',
    ),
    Track(
      'Beautiful Now',
      'Zedd',
      1069,
      'https://github.com/Manty-K/Sample_Music/blob/master/Beautiful%20Now%20(feat.%20Jon%20Bellion).mp3?raw=true',
      Colors.white,
      imageURL:
          'https://raw.githubusercontent.com/Manty-K/Sample_Music/master/beautiful%20now.jpg',
    ),
    // Track(
    //     'Hit it',
    //     'Gta',
    //     1070,
    //     'https://github.com/Manty-K/Sample_Music/blob/master/GTA%2C%20Henrix%20%26%20Digital%20Lab%20-%20Hit%20It%20(Original%20mix).mp3?raw=true',
    //     Colors.red,
    //     imageURL:
    //         'https://raw.githubusercontent.com/Manty-K/Sample_Music/master/hit-it.jpg'),
    Track(
        'Villian',
        'Blackpink',
        1074,
        'https://github.com/Manty-K/Sample_Music/blob/master/VILLAIN.mp3?raw=true',
        Colors.purple,
        imageURL:
            'https://raw.githubusercontent.com/Manty-K/Sample_Music/master/kda-villian.jpg'),
  ];
}
