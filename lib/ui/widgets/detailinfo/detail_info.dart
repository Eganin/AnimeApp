import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/widgets/common/detail_subtitle.dart';
import 'package:anime_app/ui/widgets/detailinfo/characters_list.dart';
import 'package:anime_app/ui/widgets/detailinfo/body/detailInfo_body.dart';
import 'package:anime_app/ui/widgets/detailinfo/episode_list.dart';
import 'package:anime_app/ui/widgets/detailinfo/recommendation_list.dart';
import 'package:anime_app/ui/widgets/detailinfo/reviews_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailInfo extends StatefulWidget {
  int id;
  AnimeTypes type = AnimeTypes.ANIME;

  DetailInfo({
    this.id,
    this.type,
  });

  @override
  _DetailInfoState createState() => _DetailInfoState(
        id: id,
        type: type,
      );
}

class _DetailInfoState extends State<DetailInfo> {
  int id;
  AnimeTypes type;
  DetailAnimeCubit detailCubit;

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  _DetailInfoState({
    this.id,
    this.type,
  });

  @override
  void initState() {
    super.initState();
    detailCubit = BlocProvider.of<DetailAnimeCubit>(context);
    if (type == AnimeTypes.ANIME) {
      detailCubit.fetchAnimeDetailData(
        id: id,
      );
    } else {
      detailCubit.fetchMangaDetailData(
        id: id,
      );
    }

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

      if (state is DataLoadedState || state is DataUpdateDb) {
        return Scaffold(
          body: DetailInfoBody(
            detailCubit: detailCubit,
            closeTopContainer: closeTopContainer,
            size: size,
            categoryHeight: categoryHeight,
            controller: controller,
            type: type,
          ),
          floatingActionButton: _detailFloatingButton(
            id: id,
            cubit: detailCubit,
            context: context,
            type: type,
            imageUrl: detailCubit.data.imageUrl,
          ),
        );
      }

      return CircularProgressIndicator();
    });
  }
}

FloatingActionButton _detailFloatingButton(
    {DetailAnimeCubit cubit,
    int id,
    BuildContext context,
    AnimeTypes type,
    String imageUrl}) {
  return FloatingActionButton(
    child: Icon(cubit.imageFloatingData),
    backgroundColor: Colors.pinkAccent,
    onPressed: () {
      if (cubit.isDeleteFavourite) {
        cubit.deleteFavourite(
          id: id,
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Delete to favourite'),
        ));
      } else {
        if (type == AnimeTypes.ANIME) {
          cubit.insertNewFavourite(
            favourite: Favourite(
              id: null,
              malId: id,
              imageUrl: imageUrl,
              type: PageCharacter.ANIME.value,
            ),
          );
        } else {
          cubit.insertNewFavourite(
            favourite: Favourite(
              id: null,
              malId: id,
              imageUrl: imageUrl,
              type: PageCharacter.MANGA.value,
            ),
          );
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Added to favourite'),
        ));
      }
    },
  );
}
