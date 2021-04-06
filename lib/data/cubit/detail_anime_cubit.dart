import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/models/anime/detail/anime_detail_info.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAnimeCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  AnimeDetailInfo data;

  DetailAnimeCubit({this.repository}) : super(DataEmptyState());

  Future<void> fetchDetailData(
      {AnimeTypes type = AnimeTypes.ANIME, int id}) async {
    try {
      emit(DataLoadingState());

      final AnimeDetailInfo _loadedData = await repository.getAnimeDetailInfo(
        type: type,
        id: id,
      );
      data = _loadedData;

      emit(DataLoadedState());
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }
}
