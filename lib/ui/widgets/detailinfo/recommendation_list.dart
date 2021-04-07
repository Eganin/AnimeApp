import 'package:anime_app/data/models/anime/detail/recommendation/anime_recommendation.dart';
import 'package:anime_app/data/models/anime/detail/recommendation/recommendations.dart';
import 'package:anime_app/ui/widgets/detailinfo/character.dart';
import 'package:flutter/material.dart';

class RecommendationList extends StatelessWidget {
  final AnimeRecommendation recommendations;

  RecommendationList({this.recommendations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: recommendations.recommendations.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final Recommendations rec = recommendations.recommendations[index];
            return Character(
              name: rec.title,
              imageUrl: rec.imageUrl,
            );
          }),
    );
  }
}
