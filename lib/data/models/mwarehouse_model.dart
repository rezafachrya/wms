part of 'models.dart';

class MwarehouseModel {
  MwarehouseModel({
    required this.mwarehousepk,
    this.lastupdated,
    this.updatedby,
    this.whaddress,
    this.whid,
    this.whlat,
    this.whlong,
    this.whname,
    this.whtype,
  });

  final int mwarehousepk;
  final DateTime? lastupdated;
  final String? updatedby;
  final String? whaddress;
  final String? whid;
  final double? whlat;
  final double? whlong;
  final String? whname;
  final String? whtype;

  factory MwarehouseModel.fromJson(Map<String, dynamic> json) =>
      MwarehouseModel(
        mwarehousepk: json["mwarehousepk"] ?? 0,
        lastupdated: json["lastupdated"] == null
            ? null
            : DateTime.parse(json["lastupdated"]),
        updatedby: json["updatedby"]?.trim() ?? '',
        whaddress: json["whaddress"]?.trim() ?? '',
        whid: json["whid"]?.trim() ?? '',
        whlat: json["whlat"]?.toDouble() ?? 0,
        whlong: json["whlong"]?.toDouble() ?? 0,
        whname: json["whname"]?.trim() ?? '',
        whtype: json["whtype"]?.trim() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "mwarehousepk": mwarehousepk,
        "lastupdated": lastupdated?.toIso8601String(),
        "updatedby": updatedby,
        "whaddress": whaddress,
        "whid": whid,
        "whlat": whlat,
        "whlong": whlong,
        "whname": whname,
        "whtype": whtype,
      };
}
