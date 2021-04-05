import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/models/top.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/ui/widgets/categories_scroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeList extends StatefulWidget {
  @override
  _AnimeListState createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();

  void handlerController({MainAnimeCubit animeCubit, double value}) {
    animeCubit.topContainer = value;
    animeCubit.closeTopContainer = controller.offset > 50;
  }

  void getPostsData({DataLoadedState state, MainAnimeCubit animeCubit}) {
    List<Top> responseList = state.loadedData;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.title,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post.episodes.toString(),
                        style:
                            const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        post.rank.toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Image.network(
                  post.imageUrl,
                  //height: double.infinity,
                  fit: BoxFit.cover,
                )
              ],
            ),
          )));
    });
    animeCubit.itemsData = listItems;
  }

  @override
  Widget build(BuildContext context) {
    final MainAnimeCubit animeCubit = BlocProvider.of<MainAnimeCubit>(context);

    controller.addListener(() {
      double value = controller.offset / 119;
      handlerController(animeCubit: animeCubit, value: value);
    });

    animeCubit.fetchAnime(
      type: AnimeTypes.ANIME,
      subtype: Subtype.TV,
    );

    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;

    return BlocBuilder<MainAnimeCubit, DataState>(
      builder: (context, state) {
        if (state is DataLoadedState) {
          getPostsData(state: state, animeCubit: animeCubit);
          return Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: animeCubit.closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: size.width,
                      alignment: Alignment.topCenter,
                      height: animeCubit.closeTopContainer ? 0 : categoryHeight,
                      child: categoriesScroller),
                ),
                Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: animeCubit.itemsData.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (animeCubit.topContainer > 0.5) {
                            scale = index + 0.5 - animeCubit.topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..scale(scale, scale),
                              alignment: Alignment.bottomCenter,
                              child: Align(
                                  heightFactor: 0.7,
                                  alignment: Alignment.topCenter,
                                  child: animeCubit.itemsData[index]),
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
            child: CircularProgressIndicator(),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
