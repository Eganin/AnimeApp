import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:flutter/material.dart';

class TitleAnime extends StatelessWidget {
  final String title;

  const TitleAnime({this.title});

  @override
  Widget build(BuildContext context) {
    return wrapWidgetDetailInfo(
      widget: checkNullWidget(
        condition: title != null,
        widget: Text(title,style: Theme.of(context).textTheme.headline2,),
      ),
    );
  }
}
