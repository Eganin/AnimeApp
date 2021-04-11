import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/services/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarAnimeApp extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarAnimeAppState createState() => _AppBarAnimeAppState(
        repository: repository,
      );

  AppBarAnimeApp({Key key, AnimeRepository repository})
      : preferredSize = Size.fromWidth(kToolbarHeight),
        repository = repository,
        super(key: key);

  @override
  final Size preferredSize;

  final AnimeRepository repository;
}

class _AppBarAnimeAppState extends State<AppBarAnimeApp> {
  final AnimeRepository repository;

  _AppBarAnimeAppState({this.repository});

  bool _closeContainer = true;
  MainAnimeCubit _animeCubit;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _animeCubit = BlocProvider.of<MainAnimeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
      title: AnimatedOpacity(
        opacity: _closeContainer ? 0 : 1,
        duration: const Duration(milliseconds: 250),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          alignment: Alignment.topCenter,
          width: _closeContainer ? 0 : 240,
          child: TextField(
            controller: _controller,
            onSubmitted: (text) {
              _animeCubit.fetchSearch(
                query: text,
              );
              _controller.text='';
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              hintStyle: new TextStyle(color: Colors.black38),
              hintText: "Search",
            ),
          ),
        ),
      ),
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {
            setState(() {
              _closeContainer = !_closeContainer;
            });
          },
        ),
      ],
    );
  }
}
