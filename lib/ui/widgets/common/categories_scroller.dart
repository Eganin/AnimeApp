import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/common/category.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.25 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: <Widget>[
            Category(
              height: categoryHeight,
              color: Colors.orange[400],
              title: 'Airing',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: categoryHeight,
              color: Colors.blue[400],
              title: 'Up coming',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: categoryHeight,
              color: Colors.lightBlueAccent,
              title: 'TV',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: categoryHeight,
              color: Colors.greenAccent,
              title: 'Movie',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: categoryHeight,
              color: Colors.yellowAccent[400],
              title: 'OVA',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: categoryHeight,
              color: Colors.pinkAccent,
              title: 'Special',
              subtitle: 'Anime',
              type: AnimeTypes.ANIME,
            ),
            Category(
              height: categoryHeight,
              color: Colors.deepPurple,
              title: 'Manga',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: categoryHeight,
              color: Colors.teal,
              title: 'Novels',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: categoryHeight,
              color: Colors.indigo,
              title: 'Oneshots',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: categoryHeight,
              color: Colors.brown,
              title: 'Doujin',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: categoryHeight,
              color: Colors.deepOrange,
              title: 'Manhwa',
              subtitle: 'Manga',
              type: AnimeTypes.MANGA,
            ),
            Category(
              height: categoryHeight,
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
