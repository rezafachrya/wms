part of 'entities.dart';

class TmanifestouttrackRequestParams {
  final int tmanifestoutpk;
  final String trackdesc;
  final double tracklat;
  final double tracklong;
  final String tracklocation;
  final String tracktime;

  TmanifestouttrackRequestParams({
    required this.tmanifestoutpk,
    required this.trackdesc,
    required this.tracklat,
    required this.tracklong,
    required this.tracklocation,
    required this.tracktime,
  });

  Map<String, dynamic> toJson() => {
        'tmanifestoutfk': tmanifestoutpk,
        'trackdesc': trackdesc,
        'tracklat': tracklat,
        'tracklocation': tracklocation,
        'tracklong': tracklong,
        'tracktime': tracktime,
      };
}
