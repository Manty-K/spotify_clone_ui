import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/screens/audio_player/controller/audio_controller.dart';
import 'package:spotify_clone_ui/screens/home/model/recent_played.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';
import 'package:spotify_clone_ui/utils/song_model.dart';

class RecentPlayedTracksWidget extends StatelessWidget {
  final double defaultPadding = 10.0;
  AudioController audioController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buildTrackContainer(0),
            buildTrackContainer(1),
          ],
        ),
        Row(
          children: [
            buildTrackContainer(2),
            buildTrackContainer(3),
          ],
        ),
        Row(
          children: [
            buildTrackContainer(4),
            buildTrackContainer(5),
          ],
        ),
      ],
    );
  }

  Expanded buildTrackContainer(int trackNo) {
    Track track = RecentPlayed.recentSongs[trackNo];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: GestureDetector(
          onTap: () {
            audioController.changeSong(track);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    '${track.imageURL}',
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(width: defaultPadding),
                AppStyles.defaultText('${track.trackName}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
