import 'package:flutter/cupertino.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/episode_tile.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/music_album_tile.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/music_artist_tile.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/music_playlist_tile.dart';

class UserPrefs {
  final favArtists = <MusicArtistTile>[
    MusicArtistTile('Ajay Atul',
        'https://static.toiimg.com/photo/msid-70921733/70921733.jpg?60709'),
    MusicArtistTile('Martin Garrix',
        'https://yt3.ggpht.com/ytc/AAUvwnhrRStY9qD7J5GPEENbaQV0y0LAC8Pn0AuCbdLTfA=s900-c-k-c0x00ffffff-no-rj'),
    MusicArtistTile('Hans Zimmer',
        'https://www.ascap.com/~/media/site-pages/news-and-events/events/2018/sundance/composers-square/hans-zimmer.jpg'),
  ];

  final favAlbums = <MusicAlbumTile>[
    MusicAlbumTile(
      'Hybrid Theory',
      'https://upload.wikimedia.org/wikipedia/en/2/2a/Linkin_Park_Hybrid_Theory_Album_Cover.jpg',
      12,
    ),
    MusicAlbumTile(
      'Nevermind',
      'https://upload.wikimedia.org/wikipedia/en/b/b7/NirvanaNevermindalbumcover.jpg',
      13,
    ),
  ];

  final List<Widget> userPlaylists = <Widget>[
    MusicPlaylistTile(
        'Morning Mediatation',
        'https://files.nccih.nih.gov/meditation-thinkstockphotos-505023182-square.jpg',
        'Manthan Khandale'),
    MusicPlaylistTile(
        'Intense Workout',
        'https://i.scdn.co/image/ab67706c0000bebba5d57a8a69576832d2832fc1',
        'Prayag Aaru'),
  ];

  final List<Widget> favEpisodes = [
    EpisodeTile('How the Electrical Grid Works', 2,
        'https://picsum.photos/id/1048/200'),
    EpisodeTile('Tim Ferris Podcast : E48', 2,
        'https://yt3.ggpht.com/ytc/AAUvwnjcwIQXSKeR_t0R_bQbaSLtBMb0ksNKKvKvinGCXA=s900-c-k-c0x00ffffff-no-rj'),
  ];
}
