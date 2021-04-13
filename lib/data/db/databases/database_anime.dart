import 'dart:io';

import 'package:anime_app/data/db/models/favourite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAnimeProvider {
  DBAnimeProvider._();

  static final DBAnimeProvider db = DBAnimeProvider._();

  static Database _database;

  String animeTable = 'Anime';
  String animeColumnId = 'id';
  String animeColumnMalId = 'malId';
  String animeColumnName = 'name';
  String animeColumnType = 'type';
  String animeImageUrl = 'image_url';

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
      'CREATE TABLE $animeTable ($animeColumnId INTEGER PRIMARY KEY AUTOINCREMENT, $animeColumnMalId INTEGER , $animeColumnType TEXT , $animeColumnName TEXT , $animeImageUrl TEXT)',
    );
  }

  Future<List<Favourite>> getFavouritesAnime() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> animeMapList = await db.query(animeTable);
    final List<Favourite> animeList = [];
    animeMapList.forEach((favouriteMap) {
      animeList.add(Favourite.fromMap(favouriteMap));
    });

    return animeList;
  }

  Future<void> insertFavouriteAnime({Favourite favouriteAnime}) async {
    Database db = await this.database;
    db.insert(animeTable, favouriteAnime.toMap());
  }

  Future<int> deleteFavouriteAnime({int id}) async {
    Database db = await this.database;

    return await db.delete(
      animeTable,
      where: '$animeColumnId = ?',
      whereArgs: [id],
    );
  }
}
