import 'package:anime_app/data/models/anime/detail/reviews/reviews.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:flutter/material.dart';

class ReviewInfo extends StatelessWidget {
  final Reviews review;

  ReviewInfo({this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  detailSubtitle(
                    text: review.reviewer.username,
                    size: 12,
                  ),
                  Image.network(
                    review.reviewer.imageUrl,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 50,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  detailSubtitle(
                    text: 'Overall - ${review.reviewer.scores.overall}',
                    size: 14,
                  ),
                  detailSubtitle(
                    text: 'Characters - ${review.reviewer.scores.character}',
                    size: 14,
                  ),
                  detailSubtitle(
                    text: 'Story - ${review.reviewer.scores.story}',
                    size: 14,
                  ),
                  detailSubtitle(
                    text: 'Animation - ${review.reviewer.scores.animation}',
                    size: 14,
                  ),
                  detailSubtitle(
                    text: 'Sound - ${review.reviewer.scores.sound}',
                    size: 14,
                  ),
                  detailSubtitle(
                    text: 'Enjoyment - ${review.reviewer.scores.enjoyment}',
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(review.date.substring(0, 10)),
        Container(
          margin: const EdgeInsets.only(
            bottom: 50,
          ),
          child: Text(review.content),
        ),
      ],
    );
  }
}
