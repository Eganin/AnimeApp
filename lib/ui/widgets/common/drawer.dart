import 'package:anime_app/data/services/anime_repository.dart';
import 'package:flutter/material.dart';

class CustomSidebarDrawer extends StatefulWidget {
  final Function drawerClose;
  final AnimeRepository repository;

  const CustomSidebarDrawer({Key key, this.drawerClose, this.repository})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomSidebarDrawerState(
        repository: repository,
      );
}

class _CustomSidebarDrawerState extends State<CustomSidebarDrawer> {
  final AnimeRepository repository;

  _CustomSidebarDrawerState({this.repository});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/anime_icon.jpg",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Anime App")
                ],
              )),
          ListTile(
            title: Text('Favourite Anime '),
            onTap: () => Navigator.pushNamed(
              context,
              '/favourite/anime',
              arguments: repository,
            ),
            leading: Icon(Icons.favorite),
          ),
          Divider(
            height: 1,
            color: Colors.green[30],
          ),
          ListTile(
            title: Text('Favourite  Manga'),
            onTap: () => Navigator.pushNamed(
              context,
              '/favourite/manga',
              arguments: repository,
            ),
            leading: Icon(Icons.book),
          ),
          Divider(
            height: 1,
            color: Colors.green[30],
          ),
          ListTile(
            title: Text('Favourite Characters'),
            onTap: () => Navigator.pushNamed(
              context,
              '/favourite/characters',
              arguments: repository,
            ),
            leading: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
