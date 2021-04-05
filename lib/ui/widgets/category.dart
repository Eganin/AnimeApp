import 'package:flutter/material.dart';

class Category extends StatelessWidget {

  final double height;
  final Color color;
  final String title;
  final String subtitle;

  Category({this.height,this.color,this.title,this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 20),
      height: height,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
