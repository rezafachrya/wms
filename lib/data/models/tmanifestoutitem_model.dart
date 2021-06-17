part of 'models.dart';

class TmanifestoutitemModel extends TmanifestoutitemEntity {
  TmanifestoutitemModel({
    required this.tmanifestoutitempk,
    required this.itemqty,
    required this.mitem,
    this.tmanifestout,
  }) : super(
          tmanifestoutitempk: tmanifestoutitempk,
          itemqty: itemqty,
          mitem: mitem,
        );

  final int tmanifestoutitempk;
  final int itemqty;
  final MitemModel? mitem;
  final TmanifestoutModel? tmanifestout;

  factory TmanifestoutitemModel.fromJson(Map<String, dynamic> json) =>
      TmanifestoutitemModel(
        tmanifestoutitempk: json["tmanifestoutitempk"] ?? 0,
        itemqty: json["itemqty"] ?? 0,
        mitem:
            json["mitem"] != null ? MitemModel.fromJson(json["mitem"]) : null ,
        tmanifestout: json["tmanifestout"] == null
            ? null
            : TmanifestoutModel?.fromJson(json["tmanifestout"]),
      );

  Map<String, dynamic> toJson() => {
        "tmanifestoutitempk":
            tmanifestoutitempk,
        "itemqty": itemqty,
        "mitem": mitem == null ? null : mitem?.toJson(),
        "tmanifestout": tmanifestout == null ? null : tmanifestout?.toJson(),
      };
}
