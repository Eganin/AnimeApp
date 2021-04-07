import 'package:anime_app/data/models/anime/detail/reviews/anime_reviews.dart';
import 'package:anime_app/data/models/anime/detail/reviews/reviews.dart';
import 'package:anime_app/ui/widgets/detailinfo/review_info.dart';
import 'package:flutter/material.dart';

class ReviewsList extends StatelessWidget {
  final AnimeReviews animeReviews;

  ReviewsList({this.animeReviews});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: animeReviews.reviews.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Reviews review = animeReviews.reviews[index];
            return ReviewInfo(
              review: review,
            );
          }),
    );
  }
}
