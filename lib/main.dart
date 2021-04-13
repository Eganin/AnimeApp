import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/ui/pages/character_page.dart';
import 'package:anime_app/ui/pages/detail_page.dart';
import 'package:anime_app/ui/pages/home_page.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'package:anime_app/ui/widgets/favourite/anime/anime_favourite.dart';
import 'package:anime_app/ui/widgets/favourite/characters/characters_favourite.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
            int id = settings.arguments;
            return MaterialPageRoute(
                builder: (_) => CharacterPage(
                      id: id,
                    ));

          case '/favourite/anime':
            AnimeRepository repository = settings.arguments;
            return MaterialPageRoute(
              builder: (_) => AnimeFavourites(
                repository: repository,
              ),
            );

          case '/favourite/characters':
            AnimeRepository repository = settings.arguments;
            return MaterialPageRoute(
              builder: (_) => CharactersFavourite(
                repository: repository,
              ),
            );

          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
      home: HomePage(),
    );
  }
}

enum PageCharacter {
  CHARACTERS,
  ANIME,
  OTHER,
}
