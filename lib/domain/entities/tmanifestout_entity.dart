part of 'entities.dart';

class TmanifestoutEntity extends Equatable {
  final int tmanifestoutpk;
  final String manifestid;
  final String locdesti;
  final String loccurrent;
  final String status;

  TmanifestoutEntity({
    required this.tmanifestoutpk,
    required this.manifestid,
    required this.locdesti,
    required this.status,
    required this.loccurrent,
  });

  @override
  List<Object> get props => [tmanifestoutpk];
}
