import 'dart:convert';

import 'package:anime_app/data/models/anime_data.dart';
import 'package:http/http.dart' as http;

class AnimeProvider {
  final AnimeTypes type;

  final int page;

  var subtype = '';

  AnimeProvider({this.type, this.page, this.subtype});

  Future<List<AnimeData>> getAnime() async {
    final url =
        Uri.https('https://api.jikan.moe/v3/top', '/$type/$page/$subtype');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> dataJson = json.decode(response.body);
      return dataJson.map((data) => AnimeData.fromJson(data)).toList();
    } else {
      throw ('Error Api');
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

enum AnimeSubtype {
  AIRING,
  UPCOMING,
  TV,
  MOVIE,
  OVA,
  SPECIAL,
}

extension AnimeSubtypeExtension on AnimeSubtype {
  String get value {
    switch (this) {
      case AnimeSubtype.AIRING:
        return 'airing';

      case AnimeSubtype.UPCOMING:
        return 'upcoming';

      case AnimeSubtype.TV:
        return 'tv';

      case AnimeSubtype.MOVIE:
        return 'movie';

      case AnimeSubtype.OVA:
        return 'ova';

      case AnimeSubtype.SPECIAL:
        return 'special';
    }
  }
}

enum MangaSubtype {
  MANGA,
  NOVELS,
  ONESHOTS,
  DOUJIN,
  MANHWA,
  MANHUA,
}

extension MangaSubtypeExtension on MangaSubtype {
  String get value {
    switch (this) {
      case MangaSubtype.MANGA:
        return 'manga';

      case MangaSubtype.NOVELS:
        return 'novels';

      case MangaSubtype.ONESHOTS:
        return 'oneshots';

      case MangaSubtype.DOUJIN:
        return 'doujin';

      case MangaSubtype.MANHWA:
        return 'manhwa';

      case MangaSubtype.MANHUA:
        return 'manhua';
    }
  }
}
