import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:anime_app/domain/interactor/anime_interactor.dart';
import 'package:anime_app/domain/repository/anime_repository.dart';
import 'package:anime_app/resource/theme/theme_config.dart';
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
    return SafeArea(
      child: Container(
        width: mediaQuery.size.width * 0.60,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              color: const Color(0xFFBAFB0B4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/icon_app.jpg",
                    width: 150,
                    height: 150,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Anime App",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Colors.green[30],
            ),
            ListTile(
              title: Text(
                'Favourite Anime ',
                style: Theme.of(context).textTheme.headline5,
              ),
              onTap: () => Navigator.pushNamed(
                context,
                '/favourite/anime',
                arguments: repository,
              ),
              leading: Icon(Icons.favorite),
            ),
            Divider(
              height: 2,
              color: Colors.green[30],
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              title: Text(
                'Favourite  Manga',
                style: Theme.of(context).textTheme.headline5,
              ),
              onTap: () => Navigator.pushNamed(
                context,
                '/favourite/manga',
                arguments: repository,
              ),
              leading: Icon(Icons.book),
            ),
            Divider(
              height: 2,
              color: Colors.green[30],
            ),
            SizedBox(
              height: 3,
            ),
            ListTile(
              title: Text(
                'Favourite Characters',
                style: Theme.of(context).textTheme.headline5,
              ),
              onTap: () => Navigator.pushNamed(
                context,
                '/favourite/characters',
                arguments: repository,
              ),
              leading: Icon(Icons.person),
            ),
            Divider(
              height: 2,
              color: Colors.green[30],
            ),
            SizedBox(
              height: 3,
            ),
            ThemeSwitcher(
              clipper: ThemeSwitcherCircleClipper(),
              builder: (context) {
                return ListTile(
                  leading: Icon(Icons.lightbulb_outline),
                  title: Text(
                    'Other Color Mode',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  onTap: () {
                    ThemeSwitcher.of(context).changeTheme(
                      theme:
                          ThemeProvider.of(context).brightness == Brightness.light
                              ? darkTheme
                              : lightTheme,
                    );
                  },
                );
              },
            ),
            Divider(
              height: 2,
              color: Colors.green[30],
            ),
          ],
        ),
      ),
    );
  }
}
