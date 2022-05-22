import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_ui/screens/search/controller/fake_genre_repo.dart';
import 'package:spotify_clone_ui/screens/search/model/genre.dart';
import 'package:spotify_clone_ui/utils/app_styles.dart';
import 'dart:math';

import 'widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  FakeGenre fakeGenre = FakeGenre();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 15),
            child: Text(
              'Search',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: SearchBar(),
          ),
        ),
        buildSectionName('Your top genres'),
        buildGenreGrid(fakeGenre.topGenres),
        buildSectionName('Popular podcasts categories'),
        buildGenreGrid(fakeGenre.popularPodcasts),
        buildSectionName('Browse All'),
        buildGenreGrid(fakeGenre.allCategories),
        SliverToBoxAdapter(
          child: Container(
            height: 55,
          ),
        )
      ],
    );
  }

  SliverPadding buildGenreGrid(List<Genre> genres) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          Genre genre = genres[index];
          return Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.only(top: 5, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  genre.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Row(
                  children: [
                    Spacer(),
                    Transform.translate(
                      offset: Offset(10, 0),
                      child: Transform.rotate(
                        angle: pi / 12,
                        child: Container(
                          height: 60,
                          width: 60,
                          child: Image.network(
                              'https://picsum.photos/id/${genre.imageID}/200'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: genre.color),
          );
        }, childCount: genres.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            mainAxisSpacing: 10),
      ),
    );
  }

  SliverPadding buildSectionName(String text) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: AppStyles.defaultText(text),
      ),
    );
  }
}

// Transform.translate(
// offset: Offset(120, 40),
// child: Transform.rotate(
// angle: -pi / 12,
