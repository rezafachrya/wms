part of 'entities.dart';

class TmanifestoutTrackEntity extends Equatable {
  final int tmanifestouttrackpk;
  final String trackdesc;
  final String tracklocation;
  final DateTime tracktime;

  TmanifestoutTrackEntity({
    required this.tmanifestouttrackpk,
    required this.trackdesc,
    required this.tracklocation,
    required this.tracktime,
  });

  @override
  List<Object?> get props => [tmanifestouttrackpk];
}
