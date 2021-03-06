import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/domain/repository/anime_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarAnimeApp extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarAnimeAppState createState() => _AppBarAnimeAppState();

  AppBarAnimeApp({Key key, AnimeRepository repository})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
}

class _AppBarAnimeAppState extends State<AppBarAnimeApp> {
  _AppBarAnimeAppState();

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
      title: AnimatedOpacity(
        opacity: _closeContainer ? 0 : 1,
        duration: const Duration(milliseconds: 250),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          alignment: Alignment.topCenter,
          width: _closeContainer ? 0 : 240,
          child: TextField(
            cursorColor:Theme.of(context).backgroundColor,
            controller: _controller,
            onSubmitted: (text) {
              if(text.isNotEmpty)
                _animeCubit.fetchSearch(
                  query: text,
                );
              _controller.text = '';
            },
            decoration: InputDecoration(
              focusColor: Theme.of(context).backgroundColor,
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  topLeft: Radius.circular(14),
                ),
              ),
              hintText: "Search",
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
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
