import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/models/anime/detail/anime_detail_info.dart';
import 'package:anime_app/data/models/anime/detail/episodes/anime_episodes.dart';
import 'package:anime_app/data/models/anime/detail/recommendation/anime_recommendation.dart';
import 'package:anime_app/data/models/anime/detail/reviews/anime_reviews.dart';
import 'package:anime_app/data/models/characters/characters_detail_info.dart';
import 'package:anime_app/data/models/data.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAnimeCubit extends Cubit<DataState> {
  final AnimeRepository repository;

  Data data;
  CharactersDetailInfo characters;
  AnimeRecommendation recommendations;
  AnimeReviews reviews;
  AnimeEpisodes episodes;
  IconData imageFloatingData = Icons.star;
  bool isDeleteFavourite=false;

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
      await isExistsFavourite(
        id: id,
      );

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
      recommendations =
          await repository.getDetailInfoMangaRecommendations(id: id);
      reviews = await repository.getDetailInfoMangaReviews(id: id);
      await isExistsFavourite(id: id);

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
    emit(DataUpdateDb());
  }

  Future<void> insertNewFavourite({Favourite favourite}) async {
    repository.insertFavourite(
      favourite: favourite,
    );
    isDeleteFavourite = true;
    imageFloatingData = Icons.close;
    emit(DataUpdateDb());
  }

  Future<void> deleteFavourite({int id}) async {
    repository.deleteFavourite(id: id);
    imageFloatingData = Icons.star;
    isDeleteFavourite = false;
    emit(DataUpdateDb());
  }

  String getGenres() {
    String result = '';
    for (final i in data.genres) {
      result += i.name.trim() + ',';
    }
    return result.substring(0, result.length - 1);
  }
}
