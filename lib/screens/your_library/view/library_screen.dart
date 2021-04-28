import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_ui/screens/your_library/controller/library_page_controller.dart';
import 'package:spotify_clone_ui/screens/your_library/model/user_prefs.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/episode_tile.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/episode_view.dart';
import 'package:spotify_clone_ui/screens/your_library/view/widget/shows_view.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';

import 'widget/album_view.dart';
import 'widget/artist_view.dart';
import 'widget/downloads_view.dart';
import 'widget/music_tab_bar.dart';
import 'widget/playlist_view.dart';
import 'widget/podcast_tab_bar.dart';

class LibraryScreen extends StatelessWidget {
  LibraryPageController controller = Get.put(LibraryPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PageView(
      controller: controller.controller.value,
      physics: NeverScrollableScrollPhysics(),
      children: [MusicPage(), PodcastPage()],
    ));
  }
}

class PodcastPage extends StatelessWidget {
  LibraryPageController pageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(right: AppStyles.defaultPadding, top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.jumpToMusic();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppStyles.defaultPadding),
                      child: AppStyles.titleTextDark('Music'),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppStyles.defaultPadding),
                      child: AppStyles.titleText('Podcast')),
                ],
              ),
            ),
            SizedBox(height: AppStyles.defaultPadding),
            PodcastTabBar(),
            Expanded(
              child: TabBarView(children: [
                EpisodeView(),
                DownloadView(),
                ShowsView(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class MusicPage extends StatelessWidget {
  LibraryPageController pageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: AppStyles.defaultPadding, top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppStyles.defaultPadding),
                      child: AppStyles.titleText('Music'),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPodcast();
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppStyles.defaultPadding),
                          child: AppStyles.titleTextDark('Podcast')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppStyles.defaultPadding),
              MusicTabBar(),
              Expanded(
                child: TabBarView(children: [
                  PlaylistView(),
                  ArtistView(),
                  AlbumView(),
                ]),
              )
            ],
          ),
        ));
  }
}
