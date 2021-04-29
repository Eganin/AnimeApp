import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/models/charactersdetail/characters.dart';
import 'package:anime_app/domain/interactor/anime_interactor.dart';
import 'package:anime_app/domain/repository/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCharactersCubit extends Cubit<DataState> {
  final AnimeRepository repository;
  AnimeInteractor _interactor;

  CharactersDetail characters;
  IconData imageFloatingData = Icons.star;
  bool isDeleteFavourite;

  DetailCharactersCubit({this.repository})
      : _interactor = AnimeInteractor(
          animeRepository: repository,
        ),
        super(DataEmptyState());

  Future<void> fetchCharacters({int id}) async {
    try {
      emit(DataLoadingState());
      characters = await _interactor.getDetailCharacters(id: id);
      await isExistsFavourite(
        id: id,
      );
      emit(DataLoadedState());
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }

  Future<void> isExistsFavourite({int id}) async {
    int result = await _interactor.getFavouriteById(
      id: id,
    );
    if (result == null) {
      isDeleteFavourite = false;
      imageFloatingData = Icons.star;
    } else {
      isDeleteFavourite = true;
      imageFloatingData = Icons.close;
    }
    emit(DataUpdateDb());
  }

  Future<void> insertNewFavourite({Favourite favourite}) {
    _interactor.insertFavourite(
      favourite: favourite,
    );
    isDeleteFavourite = true;
    imageFloatingData = Icons.close;
    emit(DataUpdateDb());
  }

  Future<void> deleteFavourite({int id}) async {
    imageFloatingData = Icons.star;
    isDeleteFavourite = false;
    _interactor.deleteFavourite(id: id);
    emit(DataUpdateDb());
  }
}
