import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/screen_controller.dart';
import 'package:spotify_clone_ui/screens/actual_search/view/actual_search_screen.dart';
import 'package:spotify_clone_ui/screens/audio_player/controller/audio_controller.dart';
import 'package:spotify_clone_ui/screens/audio_player/model/playlist.dart';
import 'package:spotify_clone_ui/screens/home/view/home_screen.dart';
import 'package:spotify_clone_ui/screens/search/view/search_screen.dart';
import 'package:spotify_clone_ui/screens/your_library/view/library_screen.dart';
import 'package:spotify_clone_ui/utils/app_colors.dart';

import 'screens/audio_player/view/audio_player_screen.dart';

void main() {
  const mySystemTheme =
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.black);
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: AppColors.black, elevation: 0),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.darkGrey,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xffb3b3b3),
          )),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var defaultSong = Playlist.list[0];

  AudioController audioController;

  final controller = Get.put(ScreenController());

  @override
  void initState() {
    audioController = Get.put(AudioController(defaultSong));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedFontSize: 12,
            currentIndex: controller.currentIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Your Library',
              ),
            ],
            onTap: (index) {
              controller.setIndex(index);
            },
          )),
      body: Stack(children: [
        Obx(() {
          switch (controller.currentIndex.value) {
            case 0:
              return HomeScreen();
              break;
            case 1:
              if (controller.searchButtonClicked.value == true) {
                return ActualSearchScreen();
              } else {
                return SearchScreen();
              }
              break;
            case 2:
              return LibraryScreen();
              break;
            default:
              return Text('No Page');
              break;
          }
        }),
        Column(
          children: [
            Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              color: Color(0xff212121),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child:
                        Obx(() => Image.network('${audioController.imageURL}')),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.to(() => AudioPlayerScreen());
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            Obx(
                              () => Text(
                                '${audioController.trackName}',
                                style: TextStyle(
                                    color: AppColors.light,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Obx(
                              () => Text(
                                '${audioController.trackArtist}',
                                style: TextStyle(
                                    color: AppColors.lightGrey, fontSize: 12),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.favorite_outline,
                        color: AppColors.lightGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (audioController.audioState.value ==
                          AudioPlayerState.PLAYING) {
                        audioController.pauseAudio();
                      } else {
                        audioController.playAudio();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GetX<AudioController>(builder: (snap) {
                        if (snap.audioState.value == AudioPlayerState.PLAYING) {
                          return Icon(Icons.pause, color: AppColors.lightGrey);
                        } else {
                          return Icon(Icons.play_arrow,
                              color: AppColors.lightGrey);
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
