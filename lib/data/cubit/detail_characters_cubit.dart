import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/models/charactersdetail/characters.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCharactersCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  CharactersDetail characters;

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
}
