part of 'tables.dart';

final String tableUsers = 'users';

class UserTableFields {
  static final List<String> values = [id, userid, password];

  static final String id = '_id';
  static final String userid = 'userid';
  static final String password = 'password';
}

class UserTable {
  final int? id;
  final String userid;
  final String password;

  const UserTable({
    this.id,
    required this.userid,
    required this.password,
  });

  UserTable copyWith({
    int? id,
    String? userid,
    String? password,
  }) =>
      UserTable(
          id: id ?? this.id,
          userid: userid ?? this.userid,
          password: password ?? this.password);

  static UserTable fromJson(Map<String, Object?> json) => UserTable(
        id: json[UserTableFields.id] as int?,
        userid: json[UserTableFields.userid] as String,
        password: json[UserTableFields.password] as String,
      );

  Map<String, Object?> toJson() => {
        UserTableFields.id: id,
        UserTableFields.userid: userid,
        UserTableFields.password: password,
      };
}
