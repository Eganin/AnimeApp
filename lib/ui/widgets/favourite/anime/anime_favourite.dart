import 'package:anime_app/data/db/databases/database_anime.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/ui/widgets/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class AnimeFavourites extends StatelessWidget {
  final AnimeRepository repository;

  AnimeFavourites({this.repository});

  @override
  Widget build(BuildContext context) {
    Future<List<Favourite>> data = DBAnimeProvider.db.getFavouritesAnime();

    return Scaffold(
      appBar: AppBarAnimeApp(),
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data.length == 0) {
            return Text('Error data loading');
          }
          if (snapshot.hasData) {
            return generateList(snapshot.data);
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  TCard generateList(List<Favourite> data) {
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
    );
  }
}
