part of 'models.dart';

class TmanifestoutitemModel extends TmanifestoutitemEntity {
  TmanifestoutitemModel({
    this.tmanifestoutitempk,
    this.itemqty,
    this.mitem,
    this.tmanifestout,
  }) : super(
          tmanifestoutitempk: tmanifestoutitempk,
          itemqty: itemqty,
          mitem: mitem,
        );

  final int tmanifestoutitempk;
  final int itemqty;
  final MitemModel mitem;
  final TmanifestoutModel tmanifestout;

  factory TmanifestoutitemModel.fromJson(Map<String, dynamic> json) =>
      TmanifestoutitemModel(
        tmanifestoutitempk: json["tmanifestoutitempk"] ?? 0,
        itemqty: json["itemqty"] ?? 0,
        mitem:
            json["mitem"] == null ? null : MitemModel.fromJson(json["mitem"]),
        tmanifestout: json["tmanifestout"] == null
            ? null
            : TmanifestoutModel.fromJson(json["tmanifestout"]),
      );

  Map<String, dynamic> toJson() => {
        "tmanifestoutitempk":
            tmanifestoutitempk == null ? null : tmanifestoutitempk,
        "itemqty": itemqty == null ? null : itemqty,
        "mitem": mitem == null ? null : mitem.toJson(),
        "tmanifestout": tmanifestout == null ? null : tmanifestout.toJson(),
      };
}
