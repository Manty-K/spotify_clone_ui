import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/screens/audio_player/model/playlist.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';
import 'package:spotify_clone_ui/utils/song_model.dart';

class AudioController extends GetxController {
  Track track;
  var trackName;
  var trackArtist;
  var imageURL;
  String songURL;
  var trackColor = AppColors.green.obs;
  AudioController(this.track) {
    trackName = track.trackName.obs;
    trackArtist = track.artistName.obs;
    imageURL = track.imageURL.obs;
    songURL = track.songURL;
    trackColor = track.color.obs;
  }
  int currentTrackNo = 0;

  var sliderPosition = 0.0.obs;
  var sliverBeingMoved = false.obs;
  void setSliderPosition(double value) {
    sliderPosition.value = value;
    update();
  }

  var loopOn = false.obs;

  void toggleLoop() {
    loopOn.value = !loopOn.value;
  }

  var shuffleOn = false.obs;

  void toggleShuffle() {
    shuffleOn.value = !shuffleOn.value;
  }

  // final url2 =
  //     'https://github.com/Manty-K/Sample_Music/blob/master/GTA%2C%20Henrix%20%26%20Digital%20Lab%20-%20Hit%20It%20(Original%20mix).mp3?raw=true';
  //
  // final url =
  //     'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4';
  //
  // final url3 =
  //     'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';

  AudioPlayer audioPlayer = AudioPlayer();

  var totalDuration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var audioState = AudioPlayerState.STOPPED.obs;

  void initAudio() async {
    await audioPlayer.setUrl('$songURL');
    await audioPlayer.setReleaseMode(ReleaseMode.STOP);
    audioPlayer.onDurationChanged.listen((event) {
      totalDuration.value = event;
      update();
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      position.value = event;
      if (event.inSeconds != 0 && !sliverBeingMoved.value) {
        // print(
        //'${event.inSeconds} : ${totalDuration.value.inSeconds} = ${event.inSeconds / totalDuration.value.inSeconds}');
        sliderPosition.value = event.inSeconds / totalDuration.value.inSeconds;
      }
      update();
      //sliderPosition.value = event.inSeconds / totalDuration.value.inSeconds;
    });

    audioPlayer.onPlayerStateChanged.listen((event) {
      audioState.value = event;
      update();
    });

    audioPlayer.onPlayerCompletion.listen((event) {
      print('Finishedddddd');
    });
  }

  playAudio() async {
    int result = await audioPlayer.play('$songURL');
    if (result == 1) {
      print('Playing');
    }
  }

  pauseAudio() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print('Paused');
    }
  }

  stopAudio() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      print('Stopped');
    }
  }

  seek(Duration duration) async {
    await audioPlayer.seek(duration);
  }

  void boom() {
    var currentValue = sliderPosition.value;
    var totalValue = totalDuration.value;
    var calculatedValue = (currentValue * totalValue.inSeconds).round();
    seek(Duration(seconds: calculatedValue));
    sliverBeingMoved.value = false;
    print('finished : $calculatedValue');
  }

  void itsMoving() {
    print("moving");
    sliverBeingMoved.value = true;
  }

  void nextSong() {
    if (currentTrackNo == Playlist.list.length - 1) {
      currentTrackNo = 0;
      changeSong(Playlist.list[0]);
      print('Reset: $currentTrackNo');
    } else {
      int newTrackInt = currentTrackNo + 1;
      currentTrackNo++;
      changeSong(Playlist.list[currentTrackNo]);
      print('Next : $currentTrackNo');
    }
  }

  void previousSong() {
    if (currentTrackNo == 0) {
      currentTrackNo = Playlist.list.length - 1;
      changeSong(Playlist.list.last);
    } else {
      currentTrackNo--;
      changeSong(Playlist.list[currentTrackNo]);
    }
  }

  void changeSong(Track newTrack) async {
    await audioPlayer.stop();
    sliderPosition.value = 0.0;
    await audioPlayer.play('${newTrack.songURL}');
    trackName.value = '${newTrack.trackName}';
    trackArtist.value = '${newTrack.artistName}';
    trackColor.value = newTrack.color;
    imageURL.value = '${newTrack.imageURL}';
    initAudio();
    print('Songggg: ${trackName.value}');
    update();
  }

  @override
  void onInit() {
    initAudio();
    super.onInit();
  }
}
