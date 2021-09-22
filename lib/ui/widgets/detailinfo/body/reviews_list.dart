import 'package:anime_app/data/models/anime/detail/reviews/anime_reviews.dart';
import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:flutter/material.dart';

import '../reviews_list.dart';

class ReviewsListWrapper extends StatelessWidget {

  final AnimeReviews reviews;

  const ReviewsListWrapper({this.reviews});

  @override
  Widget build(BuildContext context) {
    return wrapWidgetDetailInfo(
      widget: checkNullWidget(
        condition:
        reviews.reviews.isNotEmpty,
        widget: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: detailSubtitle(
                  text: 'Reviews: ',
                  size: 30.0,
                ),
              ),
              ReviewsList(
                animeReviews: reviews,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
