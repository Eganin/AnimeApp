import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/models/anime/detail/anime_detail_info.dart';
import 'package:anime_app/data/models/anime/detail/episodes/anime_episodes.dart';
import 'package:anime_app/data/models/anime/detail/recommendation/anime_recommendation.dart';
import 'package:anime_app/data/models/anime/detail/reviews/anime_reviews.dart';
import 'package:anime_app/data/models/anime/list/top.dart';
import 'package:anime_app/data/models/characters/characters_detail_info.dart';
import 'package:anime_app/data/models/charactersdetail/characters.dart';
import 'package:anime_app/data/models/manga/manga_detail_info.dart';
import 'package:anime_app/data/models/search/search_data.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/domain/repository/anime_repository.dart';

class AnimeInteractor{
  final AnimeRepository animeRepository;

  const AnimeInteractor({this.animeRepository});

  Future<List<Top>> getAnimeData({
    AnimeTypes type = AnimeTypes.ANIME,
    int page = 0,
    Subtype subtype = Subtype.AIRING,
  }) =>
      animeRepository.getAnimeData(type: type, page: page, subtype: subtype);

  Future<List<Results>> getSearchData(
      {String query, AnimeTypes type, int page}) =>
      animeRepository.getSearchData(
        query: query,
        type: type,
        page: page,
      );

  Future<AnimeDetailInfo> getAnimeDetailInfo({int id}) =>
      animeRepository.getAnimeDetailInfo(id: id);

  Future<MangaDetailInfo> getMangaDetailInfo({int id}) =>
      animeRepository.getMangaDetailInfo(
        id: id,
      );

  Future<CharactersDetailInfo> getDetailInfoCharactersAnime({int id}) =>
      animeRepository.getDetailInfoCharactersAnime(id: id);

  Future<CharactersDetailInfo> getDetailInfoCharactersManga({int id}) =>
      animeRepository.getDetailInfoCharactersManga(id: id);

  Future<AnimeEpisodes> getDetailInfoEpisodes({int id}) =>
      animeRepository.getDetailInfoEpisodes(id: id);

  Future<AnimeRecommendation> getDetailInfoRecommendations({int id}) =>
      animeRepository.getDetailInfoRecommendations(id: id);

  Future<AnimeReviews> getDetailInfoReviews({int id}) =>
      animeRepository.getDetailInfoReviews(id: id);

  Future<AnimeRecommendation> getDetailInfoMangaRecommendations({int id}) =>
      animeRepository.getDetailInfoMangaRecommendations(id: id);

  Future<AnimeReviews> getDetailInfoMangaReviews({int id}) =>
      animeRepository.getDetailInfoMangaReviews(id: id);

  Future<CharactersDetail> getDetailCharacters({int id}) =>
      animeRepository.getDetailCharacters(id: id);

  Future<List<Favourite>> getFavouriteAnime() =>
      animeRepository.getFavouriteAnime();

  Future<List<Favourite>> getFavouriteCharacters() =>
      animeRepository.getFavouriteCharacters();

  Future<List<Favourite>> getFavouriteManga() =>
      animeRepository.getFavouriteManga();

  Future<int> deleteFavourite({int id}) => animeRepository.deleteFavourite(
    id: id,
  );

  Future<void> insertFavourite({Favourite favourite}) =>
      animeRepository.insertFavourite(
        favourite: favourite,
      );

  Future<int> getFavouriteById({int id}) =>
      animeRepository.getFavouriteById(
        id: id,
      );
}