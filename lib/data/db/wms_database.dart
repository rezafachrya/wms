import 'package:path/path.dart';
import 'package:qrscan/data/tables/tables.dart';
import 'package:sqflite/sqflite.dart';

class WmsDatabase {
  static Database? _database;

  //memanggil database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('wms.db');
    return _database!;
  }

  //Membuat atau memanggil database
  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);

    /// ketika ingin upgrade / ada perubahan data
    /// jangan lupa versionnya di upgrade
    /// return await openDatabase(path, version: 2, onCreate: _createDB, onUpgrade: )
  }

  Future _createDB(Database db, int version) async {
    //Untuk tipe fieldnya  seperti sql biasa pada saaat create
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // final boolType = 'BOOLEAN NOT NULL';
    // final integerType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableUsers (
      ${UserTableFields.id} $idType,
      ${UserTableFields.userid} $textType,
      ${UserTableFields.password} $textType
    )
    ''');
    print('Database Terbuat');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
