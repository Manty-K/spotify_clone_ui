import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/screens/audio_player/controller/audio_controller.dart';
import 'package:spotify_clone_ui/screens/audio_player/model/playlist.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';
import 'widgets/my_slider.dart';

class AudioPlayerScreen extends StatelessWidget {
  final AudioController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GetBuilder<AudioController>(
          builder: (controller) {
            return Container(
              decoration: BoxDecoration(
                  color: AppColors.black,
                  gradient: LinearGradient(colors: [
                    controller.trackColor.value,
                    AppColors.black,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            );
          },
        ),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  AudioPlayerIcon(
                    Icons.expand_more,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Spacer(),
                  Text(
                    'Playing from Playlist',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  AudioPlayerIcon(Icons.more_vert),
                ],
              ),
              Spacer(),
              Container(
                height: MediaQuery.of(context).size.width - 20,
                width: MediaQuery.of(context).size.width - 20,
                child: Obx(
                  () => Image.network(
                    '${controller.imageURL}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                '${controller.trackName}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Obx(
                              () => Text(
                                '${controller.trackArtist}',
                                style: TextStyle(
                                    color: AppColors.lightGrey, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        AudioPlayerIcon(Icons.favorite_outline),
                      ],
                    ),
                  ],
                ),
              ),

              //SongSlider(),
              MySlider(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppStyles.defaultPadding * 2),
                child: Obx(
                  () {
                    String positionMin = controller.position.value
                        .toString()
                        .split('.')
                        .first
                        .split(':')[1];
                    String positionSec = controller.position.value
                        .toString()
                        .split('.')
                        .first
                        .split(':')
                        .last;
                    String totalMin = controller.totalDuration.value
                        .toString()
                        .split('.')
                        .first
                        .split(':')[1];
                    String totalSec = controller.totalDuration.value
                        .toString()
                        .split('.')
                        .first
                        .split(':')
                        .last;
                    return Row(
                      children: [
                        Text(
                          '$positionMin:$positionSec',
                          style: TextStyle(color: AppColors.lightGrey),
                        ),
                        Spacer(),
                        Text(
                          '$totalMin:$totalSec',
                          style: TextStyle(color: AppColors.lightGrey),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => AudioPlayerIcon(
                            Icons.shuffle,
                            color: controller.shuffleOn.value
                                ? AppColors.green
                                : AppColors.light,
                            onPressed: () {
                              controller.toggleShuffle();
                            },
                          ),
                        ),
                        Spacer(),
                        AudioPlayerIcon(
                          Icons.skip_previous,
                          onPressed: () {
                            controller.previousSong();
                          },
                        ),
                        Spacer(),
                        PlayButton(),
                        Spacer(),
                        AudioPlayerIcon(
                          Icons.skip_next,
                          onPressed: () {
                            controller.nextSong();
                          },
                        ),
                        Spacer(),
                        Obx(
                          () => AudioPlayerIcon(
                            Icons.repeat,
                            color: controller.loopOn.value
                                ? AppColors.green
                                : AppColors.light,
                            onPressed: () {
                              controller.toggleLoop();
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.devices,
                          color: Colors.white,
                          size: 25,
                        ),
                        Spacer(),
                        Icon(
                          Icons.playlist_play,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    ));
  }
}

class SongSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Slider(
        value: 0.5,
        onChanged: (val) {},
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  final AudioController audioController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (audioController.audioState.value == AudioPlayerState.PLAYING) {
            audioController.pauseAudio();
          } else {
            audioController.playAudio();
          }
        },
        child: Container(
          height: 80,
          width: 80,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: GetX<AudioController>(
            builder: (snap) {
              if (snap.audioState.value == AudioPlayerState.PLAYING) {
                return Icon(
                  Icons.pause,
                  color: Colors.black,
                  size: 60,
                );
              } else {
                return Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 60,
                );
              }
            },
          ),
        ));
  }
}

class AudioPlayerIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color color;
  AudioPlayerIcon(this.icon, {this.onPressed, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 28,
          color: color,
        ));
  }
}
