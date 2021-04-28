import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/services/anime_repository.dart';
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
  final repository = AnimeRepository();

  FSBStatus _fsbStatus;

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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pinkAccent,
            child: Icon(
              Icons.menu,
              color: Colors.black,
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
            drawerBackgroundColor: Colors.white,
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
    );
  }
}
