import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/utils/song_model.dart';

class RecentPlayed {
  static List<Track> recentSongs = [
    Track(
        'One',
        'Swedish House Mafia',
        10,
        'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3',
        Colors.red,
        imageURL:
            'https://upload.wikimedia.org/wikipedia/commons/3/33/Swedish_House_Mafia_featuring_Pharrell_-_One_%28Your_Love%29.jpg'),
    Track(
        'Secrets',
        'Tiesto & KSHMR',
        101,
        'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3',
        Colors.red,
        imageURL:
            'https://i1.sndcdn.com/artworks-000130479652-0im2mn-t500x500.jpg'),
    Track(
      'Animals',
      'Martin Garrix',
      1011,
      'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3',
      Colors.red,
      imageURL:
          'https://i1.sndcdn.com/artworks-000051272448-1ma0pn-t500x500.jpg',
    ),
    Track(
        'Bad',
        'David Guetta',
        10,
        'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3',
        Colors.red,
        imageURL:
            'https://i1.sndcdn.com/artworks-000073675254-ixrkix-t500x500.jpg'),
    Track(
        'Alive',
        'Krewella',
        10,
        'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3',
        Colors.red,
        imageURL: 'https://i.imgur.com/uarz5.jpg'),
    Track(
        'Get Low',
        'Dillon Francis & DJ Snake',
        10,
        'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3',
        Colors.red,
        imageURL:
            'https://i1.sndcdn.com/artworks-000091536479-m3nhnu-t500x500.jpg'),
  ];
}
