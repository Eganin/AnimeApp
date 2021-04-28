import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter/material.dart';
import 'category.dart';

class CategoriesScroller extends StatelessWidget {

  final double height;

  CategoriesScroller({this.height});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: <Widget>[
            Category(
              height: height,
              color: Colors.orange[400],
              title: 'Airing',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: height,
              color: Colors.blue[400],
              title: 'Up coming',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: height,
              color: Colors.lightBlueAccent,
              title: 'TV',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: height,
              color: Colors.greenAccent,
              title: 'Movie',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: height,
              color: Colors.yellowAccent[400],
              title: 'OVA',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: height,
              color: Colors.pinkAccent,
              title: 'Special',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: height,
              color: Colors.deepPurple,
              title: 'Manga',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: height,
              color: Colors.teal,
              title: 'Novels',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: height,
              color: Colors.indigo,
              title: 'Oneshots',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: height,
              color: Colors.brown,
              title: 'Doujin',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: height,
              color: Colors.deepOrange,
              title: 'Manhwa',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: height,
              color: Colors.tealAccent,
              title: 'Manhua',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
          ],
        ),
      ),
    );
  }
}
