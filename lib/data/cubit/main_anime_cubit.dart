import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/models/top.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAnimeCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  int _page = -1;

  MainAnimeCubit({this.repository}) : super(DataEmptyState());

  Future<void> fetchAnime({
    AnimeTypes type,
    Subtype subtype,
  }) async {
    try {
      emit(DataLoadingState());

      _page++;
      final List<Top> _loadedData = await repository.getData(
        type: type,
        page: _page,
        subtype: subtype,
      );

      emit(DataLoadedState(loadedData: _loadedData));
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }
}
