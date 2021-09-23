import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  backgroundColor: Colors.white,
  canvasColor: Colors.black54,
  splashColor: Colors.blue,
  floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
      backgroundColor: Colors.amberAccent
  ),
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: Colors.blueAccent,
    titleTextStyle: TextStyle(color: Colors.black38),
  ),
  iconTheme: const IconThemeData().copyWith(color: Colors.black),
  textTheme: TextTheme(
    headline2: const TextStyle(
      color: Colors.black,
      fontSize: 32.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
    headline3: const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      //fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      fontSize: 11.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0,
    ),
    bodyText2: TextStyle(
      color: Colors.grey[300],
      letterSpacing: 1.0,
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  splashColor: Colors.black12,
  floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
    backgroundColor: Colors.amberAccent
  ),
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: Colors.black26,
  ),
  iconTheme: const IconThemeData().copyWith(color: Colors.white),
  textTheme: TextTheme(
    headline2: const TextStyle(
      color: Colors.white,
      fontSize: 32.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
    headline3: const TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      //fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      fontSize: 11.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0,
    ),
    bodyText2: TextStyle(
      color: Colors.grey[300],
      letterSpacing: 1.0,
    ),
  ),
);
