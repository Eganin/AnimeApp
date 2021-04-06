import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/list/card.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/common/categories_scroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AnimeList extends StatefulWidget {
  @override
  _AnimeListState createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  MainAnimeCubit animeCubit;

  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    animeCubit = BlocProvider.of<MainAnimeCubit>(context);
    animeCubit.fetchAnime(
      type: AnimeTypes.ANIME,
      subtype: Subtype.AIRING,
    );
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
    final double categoryHeight = size.height * 0.25;

    return BlocBuilder<MainAnimeCubit, DataState>(
      builder: (context, state) {
        if (state is DataLoadedState) {
          return Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: size.width,
                      alignment: Alignment.topCenter,
                      height: closeTopContainer ? 0 : categoryHeight,
                      child: categoriesScroller),
                ),
                Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: animeCubit.itemsData.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topContainer > 0.5) {
                            scale = index + 0.5 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          if (index > animeCubit.itemsData.length - 2)
                            animeCubit.loadedAnime();

                          return Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..scale(scale, scale),
                              alignment: Alignment.bottomCenter,
                              child: Align(
                                  heightFactor: 0.7,
                                  alignment: Alignment.topCenter,
                                  child: AnimeCard(
                                    post: animeCubit.itemsData[index],
                                  )),
                            ),
                          );
                        })),
              ],
            ),
          );
        }

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

        return CircularProgressIndicator();
      },
    );
  }
}