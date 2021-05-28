part of 'models.dart';

class TmanifestoutModel extends TmanifestoutEntity {
  TmanifestoutModel({
    this.tmanifestoutpk,
    this.createdby,
    this.createtime,
    this.loccurrent,
    this.locdesti,
    this.manifestid,
    this.status,
    this.mwarehouse,
    this.msubwh,
  }) : super(
          tmanifestoutpk: tmanifestoutpk,
          manifestid: manifestid,
          locdesti: locdesti,
        );

  final int tmanifestoutpk;
  final String createdby;
  final DateTime createtime;
  final String loccurrent;
  final String locdesti;
  final String manifestid;
  final String status;
  final MwarehouseModel mwarehouse;
  final MsubwhModel msubwh;

  factory TmanifestoutModel.fromJson(Map<String, dynamic> json) =>
      TmanifestoutModel(
        tmanifestoutpk: json["tmanifestoutpk"] ?? 0,
        createdby: json["createdby"]?.trim() ?? '',
        createtime: json["createtime"] == null
            ? null
            : DateTime.parse(json["createtime"]),
        loccurrent: json["loccurrent"]?.trim() ?? '',
        locdesti: json["locdesti"]?.trim() ?? '',
        manifestid: json["manifestid"]?.trim() ?? '',
        status: json["status"]?.trim() ?? '',
        mwarehouse: MwarehouseModel.fromJson(json["mwarehouse"]),
        msubwh: MsubwhModel.fromJson(json["msubwh"]),
      );

  Map<String, dynamic> toJson() => {
        "tmanifestoutpk": tmanifestoutpk,
        "createdby": createdby,
        "createtime": createtime.toIso8601String(),
        "loccurrent": loccurrent,
        "locdesti": locdesti,
        "manifestid": manifestid,
        "status": status,
        "mwarehouse": mwarehouse.toJson(),
        "msubwh": msubwh.toJson(),
      };
}
