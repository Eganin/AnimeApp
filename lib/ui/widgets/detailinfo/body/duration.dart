import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:flutter/material.dart';

class DurationComposition extends StatelessWidget {

  final String duration;

  const DurationComposition({this.duration});

  @override
  Widget build(BuildContext context) {
    return wrapWidgetDetailInfo(
      widget: checkNullWidget(
        condition: duration != null,
        widget: detailSubtitle(
          text:
          "Duration : $duration",
          size: 17.0,
        ),
      ),
    );
  }
}
