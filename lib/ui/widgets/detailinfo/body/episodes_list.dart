import 'package:anime_app/data/models/anime/detail/episodes/anime_episodes.dart';
import 'package:anime_app/ui/utils/check_null_widget.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:flutter/material.dart';
import '../episode_list.dart';

class EpisodesListWrapper extends StatelessWidget {
  final AnimeEpisodes episodes;

  const EpisodesListWrapper({this.episodes});

  @override
  Widget build(BuildContext context) {
    return wrapWidgetDetailInfo(
      widget: checkNullWidget(
        condition: episodes != null,
        widget: checkNullWidget(
          condition: episodes.episodes.isNotEmpty,
          widget: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Episodes: ',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              EpisodeList(
                episodes: episodes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
