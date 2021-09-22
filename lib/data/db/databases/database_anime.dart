import 'dart:io';

import 'package:anime_app/data/db/models/favourite.dart';
import 'package:anime_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAnimeProvider {
  DBAnimeProvider._();

  static final DBAnimeProvider db = DBAnimeProvider._();

  static Database _database;

  String table = 'Anime';
  String columnId = 'id';
  String columnMalId = 'malId';
  String columnName = 'name';
  String columnType = 'type';
  String columnImageUrl = 'image_url';

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'Anime.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $table ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnMalId INTEGER UNIQUE , $columnType TEXT , $columnName TEXT , $columnImageUrl TEXT)',
    );
  }

  Future<List<Favourite>> getFavouritesAnime() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> animeMapList =
        await db.query(table, where: '$columnType = ?', whereArgs: [
      PageCharacter.ANIME.value,
    ]);
    final List<Favourite> animeList = [];
    animeMapList.forEach((favouriteMap) {
      animeList.add(Favourite.fromMap(favouriteMap));
    });

    return animeList;
  }

  Future<List<Favourite>> getFavouritesManga() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> animeMapList =
        await db.query(table, where: '$columnType = ?', whereArgs: [
      PageCharacter.MANGA.value,
    ]);
    final List<Favourite> animeList = [];
    animeMapList.forEach((favouriteMap) {
      animeList.add(Favourite.fromMap(favouriteMap));
    });

    return animeList;
  }

  Future<List<Favourite>> getFavouritesCharacters() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> animeMapList =
        await db.query(table, where: '$columnType = ?', whereArgs: [
      PageCharacter.CHARACTERS.value,
    ]);
    final List<Favourite> animeList = [];
    animeMapList.forEach((favouriteMap) {
      animeList.add(Favourite.fromMap(favouriteMap));
    });

    return animeList;
  }

  Future<int> getFavouriteById({int id}) async {
    Database db = await this.database;
    final List<Map<String, dynamic>> favouriteMapper =
        await db.query(table, where: '$columnMalId = ?', whereArgs: [
      id,
    ]);
    if (favouriteMapper == null || favouriteMapper.isEmpty) {
      return null;
    } else {
      return Favourite.fromMap(favouriteMapper[0]).malId;
    }
  }

  Future<void> insertFavourite({Favourite favourite}) async {
    Database db = await this.database;
    db.insert(table, favourite.toMap());
  }

  Future<int> deleteFavourite({int id}) async {
    Database db = await this.database;

    return await db.delete(
      table,
      where: '$columnMalId = ?',
      whereArgs: [id],
    );
  }
}
