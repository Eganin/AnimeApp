import 'package:anime_app/data/cubit/detail_characters_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'package:anime_app/ui/widgets/characterinfo/character_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterPage extends StatelessWidget {
  final AnimeRepository repository = AnimeRepository();
  final ScreenArguments arguments;
  DetailCharactersCubit charactersCubit;

  CharacterPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCharactersCubit>(
      create: (context) => DetailCharactersCubit(repository: repository),
      child: SafeArea(
        child: BlocBuilder<DetailCharactersCubit, DataState>(
          builder: (context, state) {
            charactersCubit = BlocProvider.of<DetailCharactersCubit>(context);
            charactersCubit.isExistsFavourite(
              id: arguments.id,
            );
            return Scaffold(
              backgroundColor: Colors.white,
              body: CharacterInfo(
                id: arguments.id,
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(charactersCubit.imageFloatingData),
                backgroundColor: Colors.pinkAccent,
                onPressed: () {
                  if (charactersCubit.isDeleteFavourite) {
                    charactersCubit.deleteFavourite(
                      id: arguments.id,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Delete to favourite'),
                    ));
                  } else {
                    charactersCubit.insertNewFavourite(
                      favourite: Favourite(
                        id: null,
                        malId: arguments.id,
                        imageUrl: arguments.imageUrl,
                        type: PageCharacter.CHARACTERS.value,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Added to favourite'),
                    ));
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
