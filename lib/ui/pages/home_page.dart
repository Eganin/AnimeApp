import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/domain/interactor/anime_interactor.dart';
import 'package:anime_app/domain/repository/anime_repository.dart';
import 'package:anime_app/ui/widgets/common/app_bar.dart';
import 'package:anime_app/ui/widgets/common/drawer.dart';
import 'package:anime_app/ui/widgets/list/anime_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnimeRepository repository = AnimeRepository();

  FSBStatus _fsbStatus;

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: BlocProvider<MainAnimeCubit>(
        create: (context) => MainAnimeCubit(repository: repository),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBarAnimeApp(
              repository: repository,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.yellow,
              child: Icon(
                Icons.menu,
              ),
              onPressed: () {
                setState(() {
                  _fsbStatus = _fsbStatus == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                });
              },
            ),
            body: FoldableSidebarBuilder(
              screenContents: AnimeList(),
              status: _fsbStatus,
              drawer: CustomSidebarDrawer(
                repository: repository,
                drawerClose: () {
                  setState(() {
                    _fsbStatus = FSBStatus.FSB_CLOSE;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
