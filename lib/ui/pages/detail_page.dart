import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/common/app_bar.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/detailinfo/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  final Top post;
  final repository = AnimeRepository();

  DetailPage({this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailAnimeCubit>(
      create: (context) => DetailAnimeCubit(repository: repository),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar(),
          body: DetailInfo(
            post: post,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.star),
            backgroundColor: Colors.pinkAccent,
            onPressed: (){

            },
          ),
        ),
      ),
    );
  }
}
