part of 'models.dart';

class UserModel extends UserEntity {
  UserModel({
    required this.muserpk,
    this.email,
    this.lastupdated,
    this.password,
    this.updatedby,
    this.userid,
    required this.username,
    required this.userloctype,
    required this.userlocid,
    required this.userlocname,
    required this.userloclat,
    required this.userloclong,
    this.musergroup,
  }) : super(
          muserpk: muserpk,
          username: username,
          userlocname: userlocname,
          userlocid: userlocid,
          userloclat: userloclat,
          userloclong: userloclong,
          userloctype: userloctype,
        );

  final int muserpk;
  final String? email;
  final DateTime? lastupdated;
  final String? password;
  final String? updatedby;
  final String? userid;
  final String username;
  final UserLocType userloctype;
  final String userlocid;
  final String userlocname;
  final double userloclat;
  final double userloclong;
  final MusergroupModel? musergroup;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        muserpk: json["muserpk"] ?? 0,
        email: json["email"]?.trim() ?? '',
        lastupdated: json["lastupdated"] == null
            ? null
            : DateTime.parse(json["lastupdated"]),
        password: json["password"]?.trim() ?? '',
        updatedby: json["updatedby"]?.trim() ?? '',
        userid: json["userid"]?.trim() ?? '',
        username: json["username"]?.trim() ?? '',
        userloctype: (json["userloctype"]?.trim() == 'A')
            ? UserLocType.admin
            : (json["userloctype"]?.trim() == 'C')
                ? UserLocType.region
                : (json["userloctype"]?.trim() == 'D')
                    ? UserLocType.subregion
                    : UserLocType.none,
        userlocid: json["userlocid"]?.trim() ?? '',
        userlocname: json["userlocname"]?.trim() ?? '',
        userloclat: json["userloclat"]?.toDouble() ?? 0,
        userloclong: json["userloclong"]?.toDouble() ?? 0,
        musergroup: json["musergroup"] == null
            ? null
            : MusergroupModel.fromJson(json["musergroup"]),
      );

  Map<String, dynamic> toJson() => {
        "muserpk": muserpk,
        "email": email == null ? null : email,
        "lastupdated":
            lastupdated == null ? null : lastupdated?.toIso8601String(),
        "password": password == null ? null : password,
        "updatedby": updatedby == null ? null : updatedby,
        "userid": userid == null ? null : userid,
        "username": username,
        "userloctype": userloctype,
        "userlocid": userlocid,
        "userlocname": userlocname,
        "userloclat": userloclat,
        "userloclong": userloclong,
        "musergroup": musergroup == null ? null : musergroup?.toJson(),
      };
}
