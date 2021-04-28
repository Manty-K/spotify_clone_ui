import 'package:flutter/cupertino.dart';
import 'package:spotify_clone_ui/screens/home/view/widets/artist_tile.dart';
import 'package:spotify_clone_ui/screens/home/view/widets/playlist_tile.dart';

class Sections {
  List<Widget> topShows = [
    PlaylistTile('Monday Motivation', 'Show Motivationaly', 1057),
    PlaylistTile('Goals Billionaire', 'Tolu Dave', 239),
    PlaylistTile('Morning Meal', 'Star City', 265),
  ];

  List<Widget> jumpBackIn = [
    PlaylistTile('Kgf Chapter 1', 'Ravi Basrur, Tanishk Bagchi', 1082),
    PlaylistTile('Kaha Par Hai', 'MC Stan', 30),
    PlaylistTile('Tanhaji', 'Mehul Vyas', 299),
  ];

  List<Widget> recentListening = [
    PlaylistTile('Top Hits Hindi', 'Hottest tracks here', 39),
    ArtistTile('Dino James', 177),
    ArtistTile('Linkin Park', 325)
  ];

  List<Widget> recommendedForToday = [
    PlaylistTile('Hancock', 'Single by Dino James', 336),
    PlaylistTile('Autobiography', 'Single by Loka', 1005),
    PlaylistTile('Sunn Na', 'Single by Bali', 338),
    PlaylistTile('Say My Name', 'Single by KR\$NA', 334),
  ];
}
