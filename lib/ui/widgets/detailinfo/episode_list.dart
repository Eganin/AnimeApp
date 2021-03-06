import 'package:anime_app/data/models/anime/detail/episodes/anime_episodes.dart';
import 'package:flutter/material.dart';

class EpisodeList extends StatelessWidget {
  final AnimeEpisodes episodes;

  EpisodeList({this.episodes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: 20,
              thickness: 2,
            );
          },
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          itemCount: episodes.episodes.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                episodes.episodes[index].title.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Text(
                episodes.episodes[index].titleJapanese.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              leading: Text(
                episodes.episodes[index].episodeId.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          }),
    );
  }
}
