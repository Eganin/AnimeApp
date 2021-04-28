import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/models/data_card.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAnimeCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  int _page = 1;

  AnimeTypes lastType;
  Subtype lastSubtype;

  List<DataCard> itemsData = [];

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

      final List<DataCard> _loadedData = await repository.getAnimeData(
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

  Future<void> fetchSearch({String query}) async {
    try {
      emit(DataLoadingState());

      _page=1;
      itemsData = await repository.getSearchData(
        query: query,
        page: _page,
        type: lastType,
      );
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
        final List<DataCard> _loadedData = await repository.getAnimeData(
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
