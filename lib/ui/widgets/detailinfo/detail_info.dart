import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:anime_app/ui/widgets/detailinfo/characters_info.dart';
import 'package:anime_app/ui/widgets/detailinfo/episode_list.dart';
import 'package:anime_app/ui/widgets/detailinfo/recommendation_list.dart';
import 'package:anime_app/ui/widgets/detailinfo/reviews_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailInfo extends StatefulWidget {
  Top post;

  DetailInfo({this.post});

  @override
  _DetailInfoState createState() => _DetailInfoState(post: post);
}

class _DetailInfoState extends State<DetailInfo> {
  Top post;
  DetailAnimeCubit detailCubit;

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  _DetailInfoState({this.post});

  @override
  void initState() {
    super.initState();
    detailCubit = BlocProvider.of<DetailAnimeCubit>(context);
    detailCubit.fetchDetailData(type: AnimeTypes.ANIME, id: post.malId);

    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.3;

    return BlocBuilder<DetailAnimeCubit, DataState>(builder: (context, state) {
      if (state is DataErrorState) {
        return Center(
          child: Text(
            'Error loaded data',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }

      if (state is DataLoadingState) {
        return Center(
          child: SpinKitDoubleBounce(
            color: Colors.black87,
            size: 100,
          ),
        );
      }

      if (state is DataLoadedState) {
        return Stack(
          children: [
            detailCubit.data.rating != null
                ? Positioned(
                    top: 10,
                    left: 10,
                    child: SizedBox(
                      width: closeTopContainer ? 0 : 60,
                      height: closeTopContainer ? 0 : 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${detailCubit.data.rating.substring(0, 6)}",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            backgroundColor: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Column(
              children: [
                AnimatedOpacity(
                  opacity: closeTopContainer ? 0 : 1,
                  duration: const Duration(milliseconds: 250),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ListView(
                      controller: controller,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      children: [
                        detailCubit.data.title != null
                            ? detailSubtitle(
                                text: detailCubit.data.title,
                                size: 32.0,
                              )
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        detailCubit.data.score != null
                            ? Align(
                                alignment: Alignment.center,
                                child: FlutterRatingBarIndicator(
                                  fillColor: Colors.lightBlueAccent,
                                  rating: detailCubit.data.score,
                                  itemCount: 10,
                                  itemSize: 20.0,
                                  emptyColor: Colors.amber.withAlpha(50),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        detailSubtitle(
                          text:
                              'Episodes : ${detailCubit.data.episodes == null ? 'No Info' : detailCubit.data.episodes.toString()}',
                          size: 17.0,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        detailCubit.data.status != null
                            ? detailSubtitle(
                                text: "Status : ${detailCubit.data.status}",
                                size: 17.0,
                              )
                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        detailCubit.data.source != null
                            ? detailSubtitle(
                                text: "Source : ${detailCubit.data.source}",
                                size: 17.0,
                              )
                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        detailCubit.data.duration != null
                            ? detailSubtitle(
                                text: "Duration : ${detailCubit.data.duration}",
                                size: 17.0,
                              )
                            : Container(),
                        SizedBox(
                          height: 5,
                        ),
                        detailSubtitle(
                          text: detailCubit.getGenres(),
                          size: 15.0,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        detailCubit.characters.characters.isNotEmpty
                            ? Container(
                                color: Colors.pinkAccent,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Characters:',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    CharactersList(
                                      info: detailCubit.characters,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 15,
                        ),
                        detailCubit.episodes.episodes.isNotEmpty
                            ? Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: detailSubtitle(
                                      text: 'Episodes: ',
                                      size: 30.0,
                                    ),
                                  ),
                                  EpisodeList(
                                    episodes: detailCubit.episodes,
                                  ),
                                ],
                              )
                            : Container(),
                        SizedBox(
                          height: 15,
                        ),
                        detailCubit.recommendations.recommendations.isNotEmpty
                            ? Container(
                                color: Colors.blueAccent,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Recommendations:',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                    RecommendationList(
                                      recommendations:
                                          detailCubit.recommendations,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        detailCubit.reviews.reviews.isNotEmpty
                            ? Container(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: detailSubtitle(
                                        text: 'Reviews: ',
                                        size: 30.0,
                                      ),
                                    ),
                                    ReviewsList(
                                      animeReviews: detailCubit.reviews,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }

      return CircularProgressIndicator();
    });
  }
}
