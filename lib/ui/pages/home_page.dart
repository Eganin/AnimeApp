import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/ui/widgets/anime_list.dart';
import 'package:anime_app/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

  final repository = AnimeRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainAnimeCubit>(
      create: (context) => MainAnimeCubit(repository: repository),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar(),

          body: AnimeList(),
        ),
      ),
    );
  }

}

