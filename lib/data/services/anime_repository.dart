import 'package:anime_app/data/models/top.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';

class AnimeRepository {
  AnimeProvider _provider = AnimeProvider();

  Future<List<Top>> getData({
    AnimeTypes type = AnimeTypes.ANIME,
    int page = 0,
    Subtype subtype = Subtype.AIRING,
  }) =>
      _provider.getAnime(type: type, page: page, subtype: subtype);
}
