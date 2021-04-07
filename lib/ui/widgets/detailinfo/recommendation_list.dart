import 'package:anime_app/data/models/anime/detail/recommendation/anime_recommendation.dart';
import 'package:flutter/material.dart';

class RecommendationList extends StatelessWidget {

  final AnimeRecommendation recommendations;

  RecommendationList({this.recommendations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: info.characters.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final character = info.characters[index];
            return Character(
              name: character.name,
              imageUrl: character.imageUrl,
              role: character.role,
            );
          }),
    );
  }
}
