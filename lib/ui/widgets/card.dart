import 'package:anime_app/data/models/top.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final Top post;

  AnimeCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Episodes - ${post.episodes == null ? 'No Info' : post.episodes.toString()}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Raiting : ${post.score}',
                      style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.network(
                  post.imageUrl,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          ),
        ));
  }
}
