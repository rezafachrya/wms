part of 'models.dart';

class MusergroupModel {
  MusergroupModel({
    this.musergrouppk,
    this.usergroupcode,
    this.usergroupname,
    this.usergroupdesc,
    this.unitcode,
    this.lastupdated,
    this.updatedby,
  });

  final int musergrouppk;
  final String usergroupcode;
  final String usergroupname;
  final String usergroupdesc;
  final String unitcode;
  final DateTime lastupdated;
  final String updatedby;

  factory MusergroupModel.fromJson(Map<String, dynamic> json) =>
      MusergroupModel(
        musergrouppk: json["musergrouppk"] ?? 0,
        usergroupcode: json["usergroupcode"]?.trim() ?? '',
        usergroupname: json["usergroupname"]?.trim() ?? '',
        usergroupdesc: json["usergroupdesc"]?.trim() ?? '',
        unitcode: json["unitcode"]?.trim() ?? '',
        lastupdated: json["lastupdated"] == null
            ? null
            : DateTime.parse(json["lastupdated"]),
        updatedby: json["updatedby"]?.trim() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "musergrouppk": musergrouppk == null ? null : musergrouppk,
        "usergroupcode": usergroupcode == null ? null : usergroupcode,
        "usergroupname": usergroupname == null ? null : usergroupname,
        "usergroupdesc": usergroupdesc == null ? null : usergroupdesc,
        "unitcode": unitcode == null ? null : unitcode,
        "lastupdated":
            lastupdated == null ? null : lastupdated.toIso8601String(),
        "updatedby": updatedby == null ? null : updatedby,
      };
}
