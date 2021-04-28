import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/screens/search/model/genre.dart';

class FakeGenre {
  var topGenres = <Genre>[
    Genre('Pop', Colors.deepPurpleAccent, 101),
    Genre('Hip Hop', Colors.deepOrange, 1011),
  ];

  var popularPodcasts = <Genre>[
    Genre('True Crime Scenes', Colors.indigo, 1024),
    Genre('Play Your Part', Colors.greenAccent, 1022),
  ];

  var allCategories = <Genre>[
    Genre('Podcasts', Colors.green, 225),
    Genre('Made for you', Colors.blueAccent, 103),
    Genre('Charts', Colors.deepPurple, 1042),
    Genre('Radio', Colors.purpleAccent, 160),
    Genre('New Release', Colors.pink, 407),
    Genre('Discover', Colors.deepPurple, 159),
    Genre('Concert', Colors.red, 158),
    Genre('Country', Colors.lightGreenAccent, 146),
    Genre('Rock', Colors.red, 446),
    Genre('Latin', Colors.blue, 152),
    Genre('Mood', Colors.purple, 21),
    Genre('Workout', Colors.blueGrey, 1044),
    Genre('Indie', Colors.lightGreen, 110),
    Genre('Dance/Electronic', Colors.pink, 117),
    Genre('Sleep', Colors.indigo, 1078),
    Genre('Decades', Colors.cyan, 1067),
  ];
}
