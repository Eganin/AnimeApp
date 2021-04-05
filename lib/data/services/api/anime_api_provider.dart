import 'dart:convert';

import 'package:anime_app/data/models/anime_data.dart';
import 'package:anime_app/data/models/top.dart';
import 'package:http/http.dart' as http;

class AnimeProvider {
  Future<List<Top>> getAnime({
    AnimeTypes type = AnimeTypes.ANIME,
    int page = 0,
    Subtype subtype = Subtype.AIRING,
  }) async {
    final url = Uri.https('api.jikan.moe',
        '/v3/top/${type.value}/$page/${subtype.value}');

    final response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      final dynamic dataJson = json.decode(response.body);
      return AnimeData.fromJson(dataJson).top;
    } else {
      throw ('${response.statusCode}');
    }
  }
}

enum AnimeTypes { ANIME, MANGA, PEOPLE, CHARACTERS }

extension AnimeTypesExtension on AnimeTypes {
  String get value {
    switch (this) {
      case AnimeTypes.ANIME:
        return 'anime';

      case AnimeTypes.MANGA:
        return 'manga';

      case AnimeTypes.CHARACTERS:
        return 'characters';

      case AnimeTypes.PEOPLE:
        return 'people';
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

Subtype getSybtypeByName({String name}){
  switch(name){
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

    default :
      return Subtype.MANHUA;
  }
}
