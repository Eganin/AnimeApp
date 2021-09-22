import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBar extends StatelessWidget {

  final double score;

  const RatingBar({this.score}) ;

  @override
  Widget build(BuildContext context) {
    return wrapWidgetDetailInfo(
      widget: checkNullWidget(
        condition: score != null,
        widget: Align(
          alignment: Alignment.center,
          child: FlutterRatingBarIndicator(
            fillColor: Colors.lightBlueAccent,
            rating: score,
            itemCount: 10,
            itemSize: 20.0,
            emptyColor: Colors.amber.withAlpha(50),
          ),
        ),
      ),
    );
  }
}
