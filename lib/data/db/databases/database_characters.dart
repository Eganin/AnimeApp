import 'dart:io';
import 'package:anime_app/data/db/models/favourite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBCharactersProvider {
  DBCharactersProvider._();

  static final DBCharactersProvider db = DBCharactersProvider._();

  static Database _database;

  String characterTable = 'Characters';
  String characterColumnId = 'id';
  String characterColumnMalId = 'malId';
  String characterColumnName = 'name';
  String characterColumnType = 'type';
  String characterImageUrl = 'image_url';

  Future<Database> get databaes async {
    if (_database != null) return _database;

    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'Characters.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $characterTable ($characterColumnId INTEGER PRIMARY KEY AUTOINCREMENT, $characterColumnMalId INTEGER UNIQUE , $characterColumnType TEXT , $characterColumnName TEXT , $characterImageUrl TEXT )',
    );
  }

  Future<List<Favourite>> getFavouritesCharacters() async {
    Database db = await this.databaes;
    final List<Map<String, dynamic>> charactersMapList =
        await db.query(characterTable);
    final List<Favourite> charactersList = [];
    charactersMapList.forEach((favouriteMap) {
      charactersList.add(Favourite.fromMap(favouriteMap));
    });

    return charactersList;
  }

  Future<void> insertFavouriteCharacter({Favourite favouriteCharacter}) async {
    Database db = await this.databaes;
    db.insert(characterTable, favouriteCharacter.toMap());
  }

  Future<int> deleteFavouriteCharacter({int id}) async {
    Database db = await this.databaes;

    return db.delete(
      characterTable,
      where: '$characterColumnId =?',
      whereArgs: [id],
    );
  }
}
