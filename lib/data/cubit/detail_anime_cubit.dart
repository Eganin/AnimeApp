import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/models/anime/detail/anime_detail_info.dart';
import 'package:anime_app/data/models/anime/detail/episodes/anime_episodes.dart';
import 'package:anime_app/data/models/anime/detail/recommendation/anime_recommendation.dart';
import 'package:anime_app/data/models/anime/detail/reviews/anime_reviews.dart';
import 'package:anime_app/data/models/characters/characters_detail_info.dart';
import 'package:anime_app/data/models/data.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAnimeCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  Data data;
  CharactersDetailInfo characters;
  AnimeRecommendation recommendations;
  AnimeReviews reviews;
  AnimeEpisodes episodes;

  DetailAnimeCubit({this.repository}) : super(DataEmptyState());

  Future<void> fetchAnimeDetailData({int id}) async {
    try {
      emit(DataLoadingState());

      final AnimeDetailInfo _loadedData = await repository.getAnimeDetailInfo(
        id: id,
      );
      data = _loadedData;
      characters = await repository.getDetailInfoCharactersAnime(id: id);
      recommendations = await repository.getDetailInfoRecommendations(id: id);
      reviews = await repository.getDetailInfoReviews(id: id);
      episodes = await repository.getDetailInfoEpisodes(id: id);

      emit(DataLoadedState());
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }

  Future<void> fetchMangaDetailData({int id}) async {
    try {
      emit(DataLoadingState());
      data = await repository.getMangaDetailInfo(
        id: id,
      );
      characters = await repository.getDetailInfoCharactersManga(id: id);
      recommendations = await repository.getDetailInfoMangaRecommendations(id: id);
      reviews = await repository.getDetailInfoMangaReviews(id: id);

      emit(DataLoadedState());
    } catch (e) {
      print(e.toString());
      emit(DataErrorState());
    }
  }

  String getGenres() {
    String result = '';
    for (final i in data.genres) {
      result += i.name.trim() + ',';
    }
    return result.substring(0, result.length - 1);
  }
}
