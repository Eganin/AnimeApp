import 'package:anime_app/data/models/anime/detail/episodes/anime_episodes.dart';
import 'package:flutter/material.dart';

class EpisodeList extends StatelessWidget {
  final AnimeEpisodes episodes;

  EpisodeList({this.episodes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: episodes.episodes.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(episodes.episodes[index].title),
              subtitle: Text(episodes.episodes[index].titleJapanese),
              leading: Text(episodes.episodes[index].episodeId.toString()),
            );

          }),
    );
  }
}
