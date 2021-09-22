import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:flutter/material.dart';

class SourceComposition extends StatelessWidget {
  final String source;

  const SourceComposition({this.source});

  @override
  Widget build(BuildContext context) {
    return wrapWidgetDetailInfo(
      widget: checkNullWidget(
        condition: source != null,
        widget: detailSubtitle(
          text: "Source : $source",
          size: 17.0,
        ),
      ),
    );
  }
}
