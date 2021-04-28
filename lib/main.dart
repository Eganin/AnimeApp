import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/ui/pages/character_page.dart';
import 'package:anime_app/ui/pages/detail_page.dart';
import 'package:anime_app/ui/pages/home_page.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'package:anime_app/ui/widgets/favourite/anime/anime_favourite.dart';
import 'package:flutter/material.dart';
import 'ui/theme/theme_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? lightTheme : darkTheme;
    return ThemeProvider(
      initTheme: initTheme,
      builder: (_, myTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Anime App',
          theme  :myTheme,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => HomePage());
              case '/detail':
                ScreenArguments arguments = settings.arguments;
                return MaterialPageRoute(
                    builder: (context) => DetailPage(
                      data: arguments,
                    ));

              case '/character':
                ScreenArguments arguments = settings.arguments;
                return MaterialPageRoute(
                    builder: (_) => CharacterPage(
                      arguments: arguments,
                    ));

              case '/favourite/anime':
                AnimeRepository repository = settings.arguments;
                return MaterialPageRoute(
                  builder: (_) => AnimeFavourites(
                    repository: repository,
                    type: PageCharacter.ANIME,
                  ),
                );

              case '/favourite/manga':
                AnimeRepository repository = settings.arguments;
                return MaterialPageRoute(
                    builder: (_) => AnimeFavourites(
                      repository: repository,
                      type: PageCharacter.MANGA,
                    ));

              case '/favourite/characters':
                AnimeRepository repository = settings.arguments;
                return MaterialPageRoute(
                  builder: (_) => AnimeFavourites(
                    repository: repository,
                    type: PageCharacter.CHARACTERS,
                  ),
                );

              default:
                return MaterialPageRoute(builder: (context) => HomePage());
            }
          },
          home: HomePage(),
        );
      },
    );
  }
}

enum PageCharacter {
  CHARACTERS,
  ANIME,
  MANGA,
  OTHER,
}

extension ExtensionPageCHaracter on PageCharacter {
  String get value {
    switch (this) {
      case PageCharacter.ANIME:
        return 'anime';

      case PageCharacter.CHARACTERS:
        return 'characters';

      case PageCharacter.MANGA:
        return 'manga';

      case PageCharacter.OTHER:
        return 'other';
    }
  }
}
