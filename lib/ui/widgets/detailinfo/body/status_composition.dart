import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:flutter/material.dart';

class StatusComposition extends StatelessWidget {

  final String status;

  const StatusComposition({this.status}) ;

  @override
  Widget build(BuildContext context) {
    return wrapWidgetDetailInfo(
      widget: checkNullWidget(
        condition: status != null,
        widget: detailSubtitle(
          text: "Status : $status",
          size: 17.0,
        ),
      ),
    );
  }
}
