import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return Column(
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
              ListView(
                controller: controller,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    detailCubit.data.title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Episodes - ${detailCubit.data.episodes == null ? 'No Info' : detailCubit.data.episodes.toString()}',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Status - ${detailCubit.data.status}",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Source - ${detailCubit.data.source}",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Raiting - ${detailCubit.data.rating}",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Score - ${detailCubit.data.score}",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
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