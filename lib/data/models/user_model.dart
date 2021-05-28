part of 'models.dart';

class UserModel extends UserEntity {
  UserModel({
    this.muserpk,
    this.email,
    this.lastupdated,
    this.password,
    this.updatedby,
    this.userid,
    this.username,
    this.userloctype,
    this.userlocid,
    this.userlocname,
    this.userloclat,
    this.userloclong,
    this.musergroup,
  }) : super(
          muserpk: muserpk,
          username: username,
          userlocname: userlocname,
          userlocid: userlocid,
          userloclat: userloclat,
          userloclong: userloclong,
        );

  final int muserpk;
  final String email;
  final DateTime lastupdated;
  final String password;
  final String updatedby;
  final String userid;
  final String username;
  final String userloctype;
  final String userlocid;
  final String userlocname;
  final double userloclat;
  final double userloclong;
  final MusergroupModel musergroup;

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
        userloctype: json["userloctype"]?.trim() ?? '',
        userlocid: json["userlocid"]?.trim() ?? '',
        userlocname: json["userlocname"]?.trim() ?? '',
        userloclat: json["userloclat"]?.toDouble() ?? 0,
        userloclong: json["userloclong"]?.toDouble() ?? 0,
        musergroup: json["musergroup"] == null
            ? null
            : MusergroupModel.fromJson(json["musergroup"]),
      );

  Map<String, dynamic> toJson() => {
        "muserpk": muserpk == null ? null : muserpk,
        "email": email == null ? null : email,
        "lastupdated":
            lastupdated == null ? null : lastupdated.toIso8601String(),
        "password": password == null ? null : password,
        "updatedby": updatedby == null ? null : updatedby,
        "userid": userid == null ? null : userid,
        "username": username == null ? null : username,
        "userloctype": userloctype == null ? null : userloctype,
        "userlocid": userlocid == null ? null : userlocid,
        "userlocname": userlocname == null ? null : userlocname,
        "userloclat": userloclat == null ? null : userloclat,
        "userloclong": userloclong == null ? null : userloclong,
        "musergroup": musergroup == null ? null : musergroup.toJson(),
      };
}
