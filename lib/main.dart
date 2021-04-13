import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
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
            return MaterialPageRoute(
              builder: (_) => AnimeFavourites(),
            );

          case '/favourite/characters':
            return MaterialPageRoute(
              builder: (_) => CharactersFavourite(),
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
