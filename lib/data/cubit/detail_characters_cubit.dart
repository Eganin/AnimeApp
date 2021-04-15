import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/models/charactersdetail/characters.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCharactersCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  CharactersDetail characters;
  IconData imageFloatingData = Icons.star;
  bool isDeleteFavourite;

  DetailCharactersCubit({this.repository}) : super(DataEmptyState());

  Future<void> fetchCharacters({int id}) async {
    try {
      emit(DataLoadingState());
      characters = await repository.getDetailCharacters(id: id);

      emit(DataLoadedState());
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }


  Future<void> isExistsFavourite({int id}) async {
    int result = await repository.getFavouriteById(
      id: id,
    );
    if (result == null) {
      isDeleteFavourite = false;
      imageFloatingData = Icons.star;
    } else {
      isDeleteFavourite = true;
      imageFloatingData = Icons.close;
    }
  }

  Future<void> insertNewFavourite({Favourite favourite}) {
    repository.insertFavourite(
      favourite: favourite,
    );
  }

  Future<void> deleteFavourite({int id}) async {
    imageFloatingData = Icons.star;
    repository.deleteFavourite(id: id);
  }

}
