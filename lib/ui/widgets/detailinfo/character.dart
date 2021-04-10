import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int id;
  final PageCharacter flag;
  final AnimeTypes type;

  Character({this.name, this.imageUrl, this.id, this.flag, this.type});

  @override
  Widget build(BuildContext context) {
    GestureDetector container = GestureDetector(
      onTap: () {
        if (flag == PageCharacter.ANIME) {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: ScreenArguments(
              id: id,
              type: type,
            ),
          );
        } else if (flag == PageCharacter.CHARACTERS) {
          Navigator.pushNamed(
            context,
            '/character',
            arguments: id,
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.srcOver),
          child: Image.network(
            imageUrl,
            height: 176,
          ),
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
