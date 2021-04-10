import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/common/app_bar.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/detailinfo/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  ScreenArguments data = ScreenArguments();
  final repository = AnimeRepository();
  int id;

  DetailPage({this.data, this.id});

  @override
  Widget build(BuildContext context) {
    print(id);
    print('-----------');
    print('-----------');
    //print(data.id);
    return BlocProvider<DetailAnimeCubit>(
      create: (context) => DetailAnimeCubit(repository: repository),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar(),
          body: data == null
              ? DetailInfo(
                  id: id,
                  type: data.type,
                )
              : DetailInfo(
                  id: data.id,
                  type: data.type,
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.star),
            backgroundColor: Colors.pinkAccent,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
