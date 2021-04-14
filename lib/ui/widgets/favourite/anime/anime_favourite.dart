import 'package:anime_app/data/db/databases/database_anime.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class AnimeFavourites extends StatelessWidget {
  final AnimeRepository repository;
  final PageCharacter type;

  AnimeFavourites({
    this.repository,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    TCardController _controller = TCardController();
    Future<List<Favourite>> data;
    if (type == PageCharacter.ANIME) {
      data = repository.getFavouriteAnime();
    } else {
      data = repository.getFavouriteCharacters();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data.length == 0) {
            /*
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Add something to your favorite list'),
            ));
             */
            return Center(
              child: Text(
                'No content',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  generateList(
                    data: snapshot.data,
                    context: context,
                    controller: _controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlineButton(
                        onPressed: () {
                          print(_controller);
                          _controller.back();
                        },
                        child: Text('Back'),
                      ),
                      OutlineButton(
                        onPressed: () {
                          _controller.reset();
                        },
                        child: Text('Reset'),
                      ),
                      OutlineButton(
                        onPressed: () {
                          _controller.forward();
                        },
                        child: Text('Forward'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  TCard generateList(
      {List<Favourite> data,
      BuildContext context,
      TCardController controller}) {
    List<Widget> cards = List.generate(
      data.length,
      (int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23.0,
                spreadRadius: -13.0,
                color: Colors.black54,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              data[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );

    return TCard(
      size: Size(400, 600),
      cards: cards,
      controller: controller,
      onForward: (index, info) {
        if (type == PageCharacter.ANIME) {
          Favourite anime = data[index - 1];
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: ScreenArguments(
              id: anime.malId,
              imageUrl: anime.imageUrl,
              type: AnimeTypes.ANIME,
            ),
          );
        } else {
          Favourite character = data[index - 1];
          Navigator.pushNamed(
            context,
            '/character',
            arguments: ScreenArguments(
              id: character.malId,
              imageUrl: character.imageUrl,
            ),
          );
        }
      },
      onBack: (index, info) {
        print(index);
      },
    );
  }
}
