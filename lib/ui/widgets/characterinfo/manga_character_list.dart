import 'package:anime_app/data/models/charactersdetail/characters.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/widgets/detailinfo/character.dart';
import 'package:flutter/material.dart';

class MangaCharactersList extends StatelessWidget {
  final CharactersDetail info;

  MangaCharactersList({this.info});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: info.mangaography.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final character = info.mangaography[index];
            return Character(
              name: character.name,
              imageUrl: character.imageUrl,
              id: character.malId,
              flag: PageCharacter.ANIME,
              type: AnimeTypes.MANGA,
            );
          }),
    );
  }
}