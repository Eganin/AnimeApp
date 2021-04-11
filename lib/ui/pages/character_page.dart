import 'package:anime_app/data/cubit/detail_characters_cubit.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/ui/widgets/characterinfo/character_info.dart';
import 'package:anime_app/ui/widgets/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterPage extends StatelessWidget {
  final AnimeRepository repository = AnimeRepository();
  final int id;

  CharacterPage({this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCharactersCubit>(
      create: (context) => DetailCharactersCubit(repository: repository),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CharacterInfo(
            id: id,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.star),
            backgroundColor: Colors.pinkAccent,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
