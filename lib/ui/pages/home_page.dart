import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:anime_app/ui/widgets/common/app_bar.dart';
import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/list/anime_list.dart';
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
          appBar: AppBarAnimeApp(
            repository: repository,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Text('AnimeApp'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Favourite Anime'),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/favourite/anime',
                    arguments: repository,
                  ),
                ),
                ListTile(
                  title: Text('Favourite Characters'),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/favourite/characters',
                    arguments: repository,
                  ),
                ),
              ],
            ),
          ),
          body: AnimeList(),
        ),
      ),
    );
  }
}
