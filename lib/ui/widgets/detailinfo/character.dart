import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String role;

  Character({this.name, this.imageUrl, this.role});

  @override
  Widget build(BuildContext context) {
    Container container = Container(
      margin: const EdgeInsets.only(right: 10),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4), BlendMode.srcOver),
        child: Image.network(
          imageUrl,
          height: 180,
        ),
      ),
    );
    return Column(
      children: [
        container,
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 120),
          child: detailSubtitle(
            text: name,
            size: 14.0,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
