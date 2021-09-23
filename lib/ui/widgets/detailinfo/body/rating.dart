import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:flutter/material.dart';

class Raiting extends StatelessWidget {
  final String rating;
  final bool closeTopContainer;

  Raiting({this.rating, this.closeTopContainer});

  @override
  Widget build(BuildContext context) {
    return checkNullWidget(
      condition: rating != null,
      widget: Positioned(
        top: 10,
        left: 10,
        child: SizedBox(
          width: closeTopContainer ? 0 : 60,
          height: closeTopContainer ? 0 : 60,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "$rating",
              style: Theme.of(context).textTheme.headline4.copyWith(
                    backgroundColor: Theme.of(context).canvasColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
