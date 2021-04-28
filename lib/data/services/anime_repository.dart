import 'package:anime_app/data/db/databases/database_anime.dart';
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
import 'package:anime_app/data/db/models/favourite.dart';

class AnimeRepository {
  AnimeProvider _provider = AnimeProvider();

  DBAnimeProvider _animeDBprovider = DBAnimeProvider.db;

  Future<List<Top>> getAnimeData({
    AnimeTypes type = AnimeTypes.ANIME,
    int page = 0,
    Subtype subtype = Subtype.AIRING,
  }) =>
      _provider.getAnime(type: type, page: page, subtype: subtype);

  Future<List<Results>> getSearchData(
          {String query, AnimeTypes type, int page}) =>
      _provider.getSearchData(
        query: query,
        type: type,
        page: page,
      );

  Future<AnimeDetailInfo> getAnimeDetailInfo({int id}) =>
      _provider.getDetailInfo(id: id);

  Future<MangaDetailInfo> getMangaDetailInfo({int id}) =>
      _provider.getMangaDetailInfo(
        id: id,
      );

  Future<CharactersDetailInfo> getDetailInfoCharactersAnime({int id}) =>
      _provider.getDetailInfoCharacters(id: id);

  Future<CharactersDetailInfo> getDetailInfoCharactersManga({int id}) =>
      _provider.getDetailInfoCharactersManga(id: id);

  Future<AnimeEpisodes> getDetailInfoEpisodes({int id}) =>
      _provider.getDetailInfoAnimeEpisodes(id: id);

  Future<AnimeRecommendation> getDetailInfoRecommendations({int id}) =>
      _provider.getDetailInfoAnimeRecommendations(id: id);

  Future<AnimeReviews> getDetailInfoReviews({int id}) =>
      _provider.getDetailInfoAnimeReviews(id: id);

  Future<AnimeRecommendation> getDetailInfoMangaRecommendations({int id}) =>
      _provider.getDetailInfoMangaRecommendations(id: id);

  Future<AnimeReviews> getDetailInfoMangaReviews({int id}) =>
      _provider.getDetailInfoMangaReviews(id: id);

  Future<CharactersDetail> getDetailCharacters({int id}) =>
      _provider.getDetailCharacters(id: id);

  Future<List<Favourite>> getFavouriteAnime() =>
      _animeDBprovider.getFavouritesAnime();

  Future<List<Favourite>> getFavouriteCharacters() =>
      _animeDBprovider.getFavouritesCharacters();

  Future<List<Favourite>> getFavouriteManga() =>
      _animeDBprovider.getFavouritesManga();

  Future<int> deleteFavourite({int id}) => _animeDBprovider.deleteFavourite(
        id: id,
      );

  Future<void> insertFavourite({Favourite favourite}) =>
      _animeDBprovider.insertFavourite(
        favourite: favourite,
      );

  Future<int> getFavouriteById({int id}) =>
      _animeDBprovider.getFavouriteById(
        id: id,
      );
}
