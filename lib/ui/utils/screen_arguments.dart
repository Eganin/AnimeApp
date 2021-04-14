import 'package:anime_app/data/services/api/anime_api_provider.dart';

class ScreenArguments {
  final int id;
  final AnimeTypes type;
  final String imageUrl;

  ScreenArguments({
    this.id = null,
    this.type = AnimeTypes.ANIME,
    this.imageUrl,
  });
}
