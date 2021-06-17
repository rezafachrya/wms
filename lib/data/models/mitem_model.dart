part of 'models.dart';

class MitemModel {
  MitemModel({
    required this.mitempk,
    this.itemid,
    required this.itemname,
    this.itempcs,
    this.lastupdated,
    this.qtyreq,
    this.qtyav,
    this.qtydo,
    this.qtydlv,
    this.updatedby,
    this.mitemgroup,
  });

  final int mitempk;
  final String? itemid;
  final String? itemname;
  final String? itempcs;
  final DateTime? lastupdated;
  final int? qtyreq;
  final int? qtyav;
  final int? qtydo;
  final int? qtydlv;
  final String? updatedby;
  final MitemgroupModel? mitemgroup;

  factory MitemModel.fromJson(Map<String, dynamic> json) => MitemModel(
        mitempk: json["mitempk"],
        itemid: json["itemid"]?.trim() ?? '',
        itemname: json["itemname"]?.trim() ?? '',
        itempcs: json["itempcs"]?.trim() ?? '',
        lastupdated: json["lastupdated"] == null
            ? null
            : DateTime?.parse(json["lastupdated"]),
        qtyreq: json["qtyreq"] ?? 0,
        qtyav: json["qtyav"] ?? 0,
        qtydo: json["qtydo"] ?? 0,
        qtydlv: json["qtydlv"] ?? 0,
        updatedby: json["updatedby"]?.trim() ?? '',
        mitemgroup: json["mitemgroup"] == null
            ? null
            : MitemgroupModel.fromJson(json["mitemgroup"]),
      );

  Map<String, dynamic> toJson() => {
        "mitempk": mitempk,
        "itemid": itemid,
        "itemname": itemname == null ? null : itemname,
        "itempcs": itempcs == null ? null : itempcs,
        "lastupdated":
            lastupdated == null ? null : lastupdated?.toIso8601String(),
        "qtyreq": qtyreq == null ? null : qtyreq,
        "qtyav": qtyav == null ? null : qtyav,
        "qtydo": qtydo == null ? null : qtydo,
        "qtydlv": qtydlv == null ? null : qtydlv,
        "updatedby": updatedby == null ? null : updatedby,
        "mitemgroup": mitemgroup == null ? null : mitemgroup?.toJson(),
      };
}
