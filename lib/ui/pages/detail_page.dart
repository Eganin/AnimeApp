import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/data/cubit/state.dart';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/main.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/common/app_bar.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/detailinfo/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  ScreenArguments data;
  final repository = AnimeRepository();
  DetailAnimeCubit detailCubit;

  DetailPage({this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailAnimeCubit>(
      create: (context) {
        return DetailAnimeCubit(repository: repository);
      },
      child: SafeArea(
        child: BlocBuilder<DetailAnimeCubit, DataState>(
          builder: (context, state) {
            detailCubit = BlocProvider.of<DetailAnimeCubit>(context);
            detailCubit.isExistsFavourite(
              id: data.id,
            );
            return Scaffold(
              backgroundColor: Colors.white,
              body: DetailInfo(
                id: data.id,
                type: data.type,
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(detailCubit.imageFloatingData),
                backgroundColor: Colors.pinkAccent,
                onPressed: () {
                  if (detailCubit.isDeleteFavourite) {
                    detailCubit.deleteFavourite(
                      id: data.id,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Delete to favourite'),
                    ));
                  } else {
                    if (data.type == AnimeTypes.ANIME) {
                      detailCubit.insertNewFavourite(
                        favourite: Favourite(
                          id: null,
                          malId: data.id,
                          imageUrl: data.imageUrl,
                          type: PageCharacter.ANIME.value,
                        ),
                      );
                    } else {
                      detailCubit.insertNewFavourite(
                        favourite: Favourite(
                          id: null,
                          malId: data.id,
                          imageUrl: data.imageUrl,
                          type: PageCharacter.MANGA.value,
                        ),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Added to favourite'),
                    ));
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
