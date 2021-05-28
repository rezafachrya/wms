part of 'entities.dart';

class TmanifestoutEntity extends Equatable {
  final int tmanifestoutpk;
  final String manifestid;
  final String locdesti;

  TmanifestoutEntity({
    @required this.tmanifestoutpk,
    @required this.manifestid,
    @required this.locdesti,
  });

  @override
  List<Object> get props => [tmanifestoutpk];
}
