part of 'data_sources.dart';

abstract class AuthenticationLocalDataSource {
  Future<int> saveUser(Map<String, dynamic> params);
  Future<List<UserTable>> readUser();
  Future<int> deleteUser();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  final WmsDatabase _wmsDatabase;

  AuthenticationLocalDataSourceImpl(this._wmsDatabase);

  @override
  Future<int> saveUser(Map<String, dynamic> params) async {
    final db = await _wmsDatabase.database;
    // final id = await db.insert(tableUsers, params);

    //kayaknya gaperlu soalnya nanti datanya di read
    // userTable.copyWith(id: id);
    return await db.insert(tableUsers, params);
  }

  @override
  Future<List<UserTable>> readUser() async {
    final db = await _wmsDatabase.database;
    final orderBy = '${UserTableFields.id} ASC';
    final result = await db.query(tableUsers, orderBy: orderBy);

    return result.map((json) => UserTable.fromJson(json)).toList();
  }

  @override
  Future<int> deleteUser() async {
    final db = await _wmsDatabase.database;
    return await db.delete(tableUsers);
  }
}
