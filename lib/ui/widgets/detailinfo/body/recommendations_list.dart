import 'package:anime_app/data/models/anime/detail/recommendation/anime_recommendation.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:flutter/material.dart';

import '../recommendation_list.dart';

class RecommendationsListWrapper extends StatelessWidget {
  final AnimeRecommendation recommendations;
  final AnimeTypes type;

  const RecommendationsListWrapper({this.recommendations, this.type});

  @override
  Widget build(BuildContext context) {
    return checkNullWidget(
      condition: recommendations.recommendations.isNotEmpty,
      widget: Container(
        color: Colors.blueAccent,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommendations:',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            RecommendationList(
              recommendations: recommendations,
              type: type,
            ),
          ],
        ),
      ),
    );
  }
}
