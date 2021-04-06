import 'package:anime_app/data/models/top.dart';
import 'package:anime_app/ui/pages/detail_page.dart';
import 'package:anime_app/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());

          case '/detail':
            Top post = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => DetailPage(post: post));

          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
      home: HomePage(),
    );
  }
}
