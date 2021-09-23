import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/ui/utils/wrap_widget.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/duration.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/image.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/list_characters.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/rating.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/rating_bar.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/recommendations_list.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/reviews_list.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/source_composition.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/status_composition.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/title.dart';
import 'package:flutter/material.dart';

import '../episode_list.dart';

class DetailInfoBody extends StatefulWidget {
  final DetailAnimeCubit detailCubit;
  final bool closeTopContainer;
  final Size size;
  final double categoryHeight;
  final ScrollController controller;
  AnimeTypes type;

  DetailInfoBody({
    this.detailCubit,
    this.closeTopContainer,
    this.size,
    this.categoryHeight,
    this.controller,
    this.type,
  });

  @override
  State<DetailInfoBody> createState() => _DetailInfoBodyState();
}

class _DetailInfoBodyState extends State<DetailInfoBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Raiting(
          rating: widget.detailCubit.data.rating,
          closeTopContainer: widget.closeTopContainer,
        ),
        Column(
          children: [
            ImageAnime(
              closeTopContainer: widget.closeTopContainer,
              categoryHeight: widget.categoryHeight,
              size: widget.size,
              imageUrl: widget.detailCubit.data.imageUrl,
            ),
            Expanded(
              child: Container(
                child: ListView(
                  controller: widget.controller,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  children: [
                    TitleAnime(title: widget.detailCubit.data.title),
                    SizedBox(
                      height: 10,
                    ),
                    RatingBar(score: widget.detailCubit.data.score),
                    SizedBox(
                      height: 5,
                    ),
                    widget.type == AnimeTypes.ANIME
                        ? wrapWidgetDetailInfo(
                            widget: Text(
                              'Episodes : ${widget.detailCubit.data.episodes == null ? 'No Info' : widget.detailCubit.data.episodes}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          )
                        : wrapWidgetDetailInfo(
                            widget: Text(
                              'Chapters : ${widget.detailCubit.data.chapters == null ? 'No Info' : widget.detailCubit.data.chapters}',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                    SizedBox(
                      height: 5,
                    ),
                    StatusComposition(status: widget.detailCubit.data.status),
                    SizedBox(
                      height: 5,
                    ),
                    SourceComposition(source: widget.detailCubit.data.source),
                    SizedBox(
                      height: 5,
                    ),
                    DurationComposition(
                      duration: widget.detailCubit.data.duration,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    wrapWidgetDetailInfo(
                      widget: Text(
                        widget.detailCubit.getGenres(),
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListCharactersWrapper(
                      characters: widget.detailCubit.characters,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    widget.detailCubit.episodes != null
                        ? widget.detailCubit.episodes.episodes.isNotEmpty
                            ? Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Episodes: ',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                  EpisodeList(
                                    episodes: widget.detailCubit.episodes,
                                  ),
                                ],
                              )
                            : Container()
                        : Container(),
                    SizedBox(
                      height: 15,
                    ),
                    RecommendationsListWrapper(
                      recommendations: widget.detailCubit.recommendations,
                    ),
                    ReviewsListWrapper(
                      reviews: widget.detailCubit.reviews,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
