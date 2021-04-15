import 'package:anime_app/data/cubit/detail_characters_cubit.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'package:anime_app/ui/widgets/characterinfo/character_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterPage extends StatelessWidget {
  final AnimeRepository repository = AnimeRepository();
  final ScreenArguments arguments;

  CharacterPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCharactersCubit>(
      create: (context) => DetailCharactersCubit(repository: repository),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CharacterInfo(
            id: arguments.id,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.star),
            backgroundColor: Colors.pinkAccent,
            onPressed: () {
              repository.insertFavourite(
                  favourite: Favourite(
                id: null,
                malId: arguments.id,
                imageUrl: arguments.imageUrl,
                type: PageCharacter.CHARACTERS.value,
              ));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Added to favourite'),
              ));
            },
          ),
        ),
      ),
    );
  }
}
