part of 'models.dart';

class TmanifestoutTrackModel extends TmanifestoutTrackEntity {
  TmanifestoutTrackModel({
    required this.tmanifestouttrackpk,
    required this.trackdesc,
    required this.tracklocation,
    this.tracklat,
    this.tracklong,
    required this.tracktime,
    this.tmanifestoutfk,
  }) : super(
          tmanifestouttrackpk: tmanifestouttrackpk,
          trackdesc: trackdesc,
          tracklocation: tracklocation,
          tracktime: tracktime,
        );

  final int tmanifestouttrackpk;
  final String trackdesc;
  final String tracklocation;
  final double? tracklat;
  final double? tracklong;
  final DateTime tracktime;
  final int? tmanifestoutfk;

  factory TmanifestoutTrackModel.fromJson(Map<String, dynamic> json) =>
      TmanifestoutTrackModel(
        tmanifestouttrackpk: json["tmanifestouttrackpk"] ?? 0,
        trackdesc: json["trackdesc"]?.trim() ?? '',
        tracklocation: json["tracklocation"]?.trim() ?? '',
        tracklat: json["tracklat"]?.toDouble() ?? 0,
        tracklong: json["tracklong"]?.toDouble() ?? 0,
        tracktime: DateTime.parse(json["tracktime"]),
        tmanifestoutfk: json["tmanifestoutfk"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "tmanifestouttrackpk": tmanifestouttrackpk,
        "trackdesc": trackdesc,
        "tracklocation": tracklocation,
        "tracklat": tracklat,
        "tracklong": tracklong,
        "tracktime": tracktime.toIso8601String(),
        "tmanifestoutfk": tmanifestoutfk,
      };
}
