part of 'entities.dart';

class TmanifestoutitemEntity extends Equatable {
  final int tmanifestoutitempk;
  final int? itemqty;
  final MitemModel? mitem;

  TmanifestoutitemEntity({
    required this.tmanifestoutitempk,
    required this.itemqty,
    this.mitem,
  });

  @override
  List<Object> get props => [tmanifestoutitempk];
}
