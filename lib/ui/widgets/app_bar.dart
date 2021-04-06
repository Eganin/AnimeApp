import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getAppBar() =>AppBar(
  elevation: 2,
  backgroundColor: Colors.white,
  leading: Icon(
    Icons.menu,
    color: Colors.black,
  ),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search, color: Colors.black),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.person, color: Colors.black),
      onPressed: () {},
    )
  ],
);