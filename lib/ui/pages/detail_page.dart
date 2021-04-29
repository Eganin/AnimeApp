import 'package:anime_app/data/cubit/detail_anime_cubit.dart';
import 'package:anime_app/domain/repository/anime_repository.dart';
import 'package:anime_app/ui/utils/screen_arguments.dart';
import 'package:anime_app/ui/widgets/detailinfo/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  ScreenArguments data;
  final repository = AnimeRepository();

  DetailPage({this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailAnimeCubit>(
      create: (context) {
        return DetailAnimeCubit(repository: repository);
      },
      child: SafeArea(
        child: Scaffold(
          body: DetailInfo(
            id: data.id,
            type: data.type,
          ),
        ),
      ),
    );
  }
}
