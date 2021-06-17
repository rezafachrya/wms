part of 'models.dart';

class MsubwhModel {
  MsubwhModel({
    required this.msubwhpk,
    this.lastupdated,
    this.updatedby,
    this.subwhaddress,
    this.subwhid,
    this.subwhlat,
    this.subwhlong,
    this.subwhname,
    this.mwarehouse,
  });

  final int msubwhpk;
  final DateTime? lastupdated;
  final String? updatedby;
  final String? subwhaddress;
  final String? subwhid;
  final double? subwhlat;
  final double? subwhlong;
  final String? subwhname;
  final MwarehouseModel? mwarehouse;

  factory MsubwhModel.fromJson(Map<String, dynamic> json) => MsubwhModel(
        msubwhpk: json["msubwhpk"] ?? 0,
        lastupdated: json["lastupdated"] == null
            ? null
            : DateTime.parse(json["lastupdated"]),
        updatedby: json["updatedby"]?.trim() ?? '',
        subwhaddress: json["subwhaddress"]?.trim() ?? '',
        subwhid: json["subwhid"]?.trim() ?? '',
        subwhlat: json["subwhlat"]?.toDouble() ?? 0,
        subwhlong: json["subwhlong"]?.toDouble() ?? 0,
        subwhname: json["subwhname"]?.trim() ?? '',
        mwarehouse: json["mwarehouse"] == null
            ? null
            : MwarehouseModel.fromJson(json["mwarehouse"]),
      );

  Map<String, dynamic> toJson() => {
        "msubwhpk": msubwhpk,
        "lastupdated": lastupdated?.toIso8601String(),
        "updatedby": updatedby,
        "subwhaddress": subwhaddress,
        "subwhid": subwhid,
        "subwhlat": subwhlat,
        "subwhlong": subwhlong,
        "subwhname": subwhname,
        "mwarehouse": mwarehouse?.toJson(),
      };
}
