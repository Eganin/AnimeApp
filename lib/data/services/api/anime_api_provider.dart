import 'dart:convert';
import 'package:anime_app/data/models/anime/detail/anime_detail_info.dart';
import 'package:anime_app/data/models/anime/detail/episodes/anime_episodes.dart';
import 'package:anime_app/data/models/anime/detail/recommendation/anime_recommendation.dart';
import 'package:anime_app/data/models/anime/detail/reviews/anime_reviews.dart';
import 'package:anime_app/data/models/anime/list/anime_data.dart';
import 'package:anime_app/data/models/anime/list/top.dart';
import 'package:anime_app/data/models/characters/characters_detail_info.dart';
import 'package:anime_app/data/models/charactersdetail/characters.dart';
import 'package:anime_app/data/models/manga/manga_detail_info.dart';
import 'package:anime_app/data/models/search/search_data.dart';
import 'package:http/http.dart' as http;

class AnimeProvider {
  Future<List<Top>> getAnime({
    AnimeTypes type = AnimeTypes.ANIME,
    int page = 0,
    Subtype subtype = Subtype.AIRING,
  }) async {
    final url = Uri.https(
        'api.jikan.moe', '/v3/top/${type.value}/$page/${subtype.value}');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return AnimeData.fromJson(json : dataJson).top;
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<List<Results>> getSearchData(
      {String query, AnimeTypes type, int page}) async {
    Map<String, String> params = {
      'q': query,
      'page': page.toString(),
    };

    final url = Uri.https(
      'api.jikan.moe',
      '/v3/search/${type.value}',
      params,
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return SearchData.fromJson(dataJson).results;
    } else {
      throw ('${url.toString()}');
    }
  }

  Future<AnimeDetailInfo> getDetailInfo({int id}) async {
    final url = Uri.https('api.jikan.moe', '/v3/${AnimeTypes.ANIME.value}/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      AnimeDetailInfo info = AnimeDetailInfo.fromJson(dataJson);
      print(info.title);
      return info;
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<MangaDetailInfo> getMangaDetailInfo({int id}) async {
    final url = Uri.https('api.jikan.moe', '/v3/${AnimeTypes.MANGA.value}/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return MangaDetailInfo.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<CharactersDetailInfo> getDetailInfoCharacters({int id}) async {
    final url = Uri.https(
        'api.jikan.moe', '/v3/${AnimeTypes.ANIME.value}/$id/characters_staff');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return CharactersDetailInfo.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<CharactersDetailInfo> getDetailInfoCharactersManga({int id}) async {
    final url = Uri.https(
        'api.jikan.moe', '/v3/${AnimeTypes.MANGA.value}/$id/characters');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return CharactersDetailInfo.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<AnimeEpisodes> getDetailInfoAnimeEpisodes({int id}) async {
    final url = Uri.https(
        'api.jikan.moe', '/v3/${AnimeTypes.ANIME.value}/$id/episodes');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return AnimeEpisodes.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<AnimeRecommendation> getDetailInfoAnimeRecommendations(
      {int id}) async {
    final url = Uri.https(
        'api.jikan.moe', '/v3/${AnimeTypes.ANIME.value}/$id/recommendations');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return AnimeRecommendation.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<AnimeRecommendation> getDetailInfoMangaRecommendations(
      {int id}) async {
    final url = Uri.https(
        'api.jikan.moe', '/v3/${AnimeTypes.MANGA.value}/$id/recommendations');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return AnimeRecommendation.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<AnimeReviews> getDetailInfoAnimeReviews({int id}) async {
    final url =
        Uri.https('api.jikan.moe', '/v3/${AnimeTypes.ANIME.value}/$id/reviews');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return AnimeReviews.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<AnimeReviews> getDetailInfoMangaReviews({int id}) async {
    final url =
        Uri.https('api.jikan.moe', '/v3/${AnimeTypes.ANIME.value}/$id/reviews');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return AnimeReviews.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }

  Future<CharactersDetail> getDetailCharacters({int id}) async {
    final url = Uri.https('api.jikan.moe', '/v3/character/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataJson = json.decode(response.body);
      return CharactersDetail.fromJson(dataJson);
    } else {
      throw ('${response.statusCode}');
    }
  }
}

enum AnimeTypes {
  ANIME,
  MANGA,
}

extension AnimeTypesExtension on AnimeTypes {
  String get value {
    switch (this) {
      case AnimeTypes.ANIME:
        return 'anime';

      case AnimeTypes.MANGA:
        return 'manga';
    }
  }
}

enum Subtype {
  AIRING,
  UPCOMING,
  TV,
  MOVIE,
  OVA,
  SPECIAL,
  MANGA,
  NOVELS,
  ONESHOTS,
  DOUJIN,
  MANHWA,
  MANHUA,
}

extension SubtypeExtension on Subtype {
  String get value {
    switch (this) {
      case Subtype.AIRING:
        return 'airing';

      case Subtype.UPCOMING:
        return 'upcoming';

      case Subtype.TV:
        return 'tv';

      case Subtype.MOVIE:
        return 'movie';

      case Subtype.OVA:
        return 'ova';

      case Subtype.SPECIAL:
        return 'special';

      case Subtype.MANGA:
        return 'manga';

      case Subtype.NOVELS:
        return 'novels';

      case Subtype.ONESHOTS:
        return 'oneshots';

      case Subtype.DOUJIN:
        return 'doujin';

      case Subtype.MANHWA:
        return 'manhwa';

      case Subtype.MANHUA:
        return 'manhua';
    }
  }
}

Subtype getSybtypeByName({String name}) {
  switch (name) {
    case 'Airing':
      return Subtype.AIRING;

    case 'Up coming':
      return Subtype.UPCOMING;

    case 'TV':
      return Subtype.TV;

    case 'Movie':
      return Subtype.MOVIE;

    case 'OVA':
      return Subtype.OVA;

    case 'Special':
      return Subtype.SPECIAL;

    case 'Manga':
      return Subtype.MANGA;

    case 'Novels':
      return Subtype.NOVELS;

    case 'Oneshots':
      return Subtype.ONESHOTS;

    case 'Doujin':
      return Subtype.DOUJIN;

    case 'Manhwa':
      return Subtype.MANHWA;

    default:
      return Subtype.MANHUA;
  }
}
