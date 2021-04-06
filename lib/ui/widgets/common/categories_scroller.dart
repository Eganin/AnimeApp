import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/ui/widgets/common/category.dart';
import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.25 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: <Widget>[

            Category(
              height: categoryHeight,
              color: Colors.orange[400],
              title: 'Airing',
              subtitle: 'pages',
            ),
            Category(
              height: categoryHeight,
              color: Colors.blue[400],
              title: 'Up coming',
              subtitle: 'pages',
            ),
            Category(
              height: categoryHeight,
              color: Colors.lightBlueAccent,
              title: 'TV',
              subtitle: 'pages',
            ),
            Category(
              height: categoryHeight,
              color: Colors.greenAccent,
              title: 'Movie',
              subtitle: 'pages',
            ),
            Category(
              height: categoryHeight,
              color: Colors.yellowAccent[400],
              title: 'OVA',
              subtitle: 'pages',
            ),
            Category(
              height: categoryHeight,
              color: Colors.pinkAccent,
              title: 'Special',
              subtitle: 'pages',
            ),
          ],
        ),
      ),
    );
  }
}
