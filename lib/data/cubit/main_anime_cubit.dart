import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/models/data_card.dart';
import 'package:anime_app/domain/interactor/anime_interactor.dart';
import 'package:anime_app/domain/repository/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAnimeCubit extends Cubit<DataState> {
  final AnimeRepository repository;
  AnimeInteractor _interactor;

  int _page = 1;

  AnimeTypes lastType;
  Subtype lastSubtype;

  List<DataCard> itemsData = [];

  bool loadedRequest = false;

  MainAnimeCubit({this.repository})
      : _interactor = AnimeInteractor(
          animeRepository: repository,
        ),
        super(DataEmptyState());

  Future<void> fetchAnime({
    AnimeTypes type,
    Subtype subtype,
  }) async {
    try {
      emit(DataLoadingState());

      lastType = type;
      lastSubtype = subtype;
      _page = 1;

      itemsData = await _interactor.getAnimeData(
        type: type,
        page: _page,
        subtype: subtype,
      );

      emit(DataLoadedState());
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }

  Future<void> fetchSearch({String query}) async {
    try {
      emit(DataLoadingState());

      _page = 1;
      itemsData = await _interactor.getSearchData(
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
        itemsData.addAll(
          await _interactor.getAnimeData(
            type: lastType,
            page: _page,
            subtype: lastSubtype,
          ),
        );
      } catch (e) {
        print(e.toString());
        emit(DataErrorState());
      }
      loadedRequest = false;
    }
  }
}
