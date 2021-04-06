import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/models/anime/detail/anime_detail_info.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';

class AnimeRepository {
  AnimeProvider _provider = AnimeProvider();

  Future<List<Top>> getAnimeData({
    AnimeTypes type = AnimeTypes.ANIME,
    int page = 0,
    Subtype subtype = Subtype.AIRING,
  }) =>
      _provider.getAnime(type: type, page: page, subtype: subtype);

  Future<AnimeDetailInfo> getAnimeDetailInfo(
          {AnimeTypes type = AnimeTypes.ANIME, int id}) =>
      _provider.getDetailInfo(type: type, id: id);
}
