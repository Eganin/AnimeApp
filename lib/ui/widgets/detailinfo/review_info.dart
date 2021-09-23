import 'package:anime_app/data/models/anime/detail/reviews/reviews.dart';
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
                  Text(
                    review.reviewer.username,
                    style: Theme.of(context).textTheme.bodyText1,
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
                  Text(
                    'Overall - ${review.reviewer.scores.overall}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Characters - ${review.reviewer.scores.character}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Story - ${review.reviewer.scores.story}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Animation - ${review.reviewer.scores.animation}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Sound - ${review.reviewer.scores.sound}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Enjoyment - ${review.reviewer.scores.enjoyment}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          review.date.substring(0, 10),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 50,
          ),
          child: Text(
            review.content,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
