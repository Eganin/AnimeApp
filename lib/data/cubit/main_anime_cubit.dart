import 'package:anime_app/data/cubit/state.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAnimeCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  int _page = 1;

  AnimeTypes lastType;
  Subtype lastSubtype;

  List<Top> itemsData = [];

  bool loadedRequest = false;

  MainAnimeCubit({this.repository}) : super(DataEmptyState());

  Future<void> fetchAnime({
    AnimeTypes type,
    Subtype subtype,
  }) async {
    try {
      emit(DataLoadingState());

      lastType = type;
      lastSubtype = subtype;
      _page = 1;

      final List<Top> _loadedData = await repository.getAnimeData(
        type: type,
        page: _page,
        subtype: subtype,
      );
      itemsData = _loadedData;

      emit(DataLoadedState());
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }

  Future<void> loadedAnime() async {
    if (!loadedRequest) {
      _page++;
      loadedRequest = true;
      try {
        final List<Top> _loadedData = await repository.getAnimeData(
          type: lastType,
          page: _page,
          subtype: lastSubtype,
        );

        itemsData.addAll(_loadedData);
      } catch (e) {
        print(e.toString());
        emit(DataErrorState());
      }
      loadedRequest = false;
    }
  }
}
