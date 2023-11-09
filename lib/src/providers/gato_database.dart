import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import 'package:gato/src/models/model.dart';

class GatoDatabase {
  static final GatoDatabase instance = GatoDatabase._init();
  static Database? _database;
  
  GatoDatabase._init();

  Future<Database> get database async {
    if ( _database !=null ) return _database!;

    _database = await _initDB('gato.db');

    return _database!;
  }
  
  Future<Database>_initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB( Database db, int version ) async {
    await db.execute( '''
      CREATE TABLE puntos(
      id INTEGER PRIMARY KEY,
      nombre TEXT,
      juegos INT,
      ganados INT,
      perdidos INT,
      empatados INT
    )
  ''');
  }

  Future<void> insert( ModeloGato registro ) async {
    final db = await instance.database;
    await db.insert("puntos", registro.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace );
  }

  Future<List<ModeloGato>> getItems() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('puntos');

    return List.generate(maps.length, (index) {
      return ModeloGato(
        nombre    : maps[index]['nombre'], 
        juegos    : maps[index]['juegos'], 
        ganados   : maps[index]['ganados'], 
        perdidos  : maps[index]['perdidos'],
        empatados : maps[index]['empatados']);
    });
  }

  Future<int> update( String nombre, String campo, int valor, int juegos ) async {
    final db = await instance.database;
    final res = db.update('puntos', {campo: valor, 'juegos': juegos}, where: 'nombre = ?', whereArgs: ['Usuario']);
    return res;
  }

  Future<List<Map<String, dynamic>>> getItem() async {
    final db = await instance.database;
    const nombre = 'Usuario';
    final res = db.query('puntos', where: 'nombre = ?', whereArgs: [nombre]);
    return res;
  }

  Future<int> reset() async {
    final db = await instance.database;
    final res = db.update(
      'puntos', {'juegos': 0, 'ganados': 0, 'perdidos': 0, 'empatados': 0}, 
      where: 'nombre = ?', 
      whereArgs: ['Usuario'] );
    return res;
  }
}