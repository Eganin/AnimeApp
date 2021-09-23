import 'package:anime_app/data/models/characters/characters_detail_info.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/widgets/detailinfo/character.dart';
import 'package:flutter/material.dart';

class CharactersList extends StatelessWidget {
  final CharactersDetailInfo info;

  CharactersList({this.info});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: info.characters.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final character = info.characters[index];
            return Character(
              name: character.name,
              imageUrl: character.imageUrl,
              id: character.malId,
              flag: PageCharacter.CHARACTERS,
            );
          }),
    );
  }
}
