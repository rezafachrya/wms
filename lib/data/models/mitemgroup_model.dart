part of 'models.dart';

class MitemgroupModel {
  MitemgroupModel({
    this.mitemgrouppk,
    this.itemgroupname,
    this.lastupdated,
    this.totalreq,
    this.totalav,
    this.totaldo,
    this.totaldlv,
    this.updatedby,
  });

  final int mitemgrouppk;
  final String itemgroupname;
  final DateTime lastupdated;
  final int totalreq;
  final int totalav;
  final int totaldo;
  final int totaldlv;
  final String updatedby;

  factory MitemgroupModel.fromJson(Map<String, dynamic> json) =>
      MitemgroupModel(
        mitemgrouppk: json["mitemgrouppk"] ?? 0,
        itemgroupname: json["itemgroupname"]?.trim() ?? '',
        lastupdated: json["lastupdated"] == null
            ? null
            : DateTime.parse(json["lastupdated"]),
        totalreq: json["totalreq"] ?? 0,
        totalav: json["totalav"] ?? 0,
        totaldo: json["totaldo"] ?? 0,
        totaldlv: json["totaldlv"] ?? 0,
        updatedby: json["updatedby"]?.trim() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "mitemgrouppk": mitemgrouppk == null ? null : mitemgrouppk,
        "itemgroupname": itemgroupname == null ? null : itemgroupname,
        "lastupdated":
            lastupdated == null ? null : lastupdated.toIso8601String(),
        "totalreq": totalreq == null ? null : totalreq,
        "totalav": totalav == null ? null : totalav,
        "totaldo": totaldo == null ? null : totaldo,
        "totaldlv": totaldlv == null ? null : totaldlv,
        "updatedby": updatedby == null ? null : updatedby,
      };
}
