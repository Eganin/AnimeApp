import 'package:anime_app/data/models/charactersdetail/characters.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/widgets/detailinfo/character.dart';
import 'package:flutter/material.dart';

class VoiceActorsList extends StatelessWidget {
  final CharactersDetail info;

  VoiceActorsList({this.info});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: info.voiceActors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final character = info.voiceActors[index];
            return Character(
              name: character.name,
              imageUrl: character.imageUrl,
              id: character.malId,
              flag: PageCharacter.OTHER,
            );
          }),
    );
  }
}