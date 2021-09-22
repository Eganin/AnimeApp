import 'package:anime_app/data/models/characters/characters_detail_info.dart';
import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:flutter/material.dart';
import '../characters_list.dart';

class ListCharactersWrapper extends StatelessWidget {

  final CharactersDetailInfo characters;

  const ListCharactersWrapper({this.characters}) ;

  @override
  Widget build(BuildContext context) {
    return checkNullWidget(
      condition:
      characters.characters.isNotEmpty,
      widget: Container(
        color: Colors.pinkAccent,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Characters:',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            CharactersList(
              info: characters,
            ),
          ],
        ),
      ),
    );
  }
}
