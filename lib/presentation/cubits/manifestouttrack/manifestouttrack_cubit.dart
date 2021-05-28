import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';

part 'manifestouttrack_state.dart';

class ManifestouttrackCubit extends Cubit<ManifestouttrackState> {
  final InsertManifestoutTrack insertManifestoutTrack;

  ManifestouttrackCubit({
    @required this.insertManifestoutTrack,
  }) : super(ManifestouttrackInitial());

  Future<void> insertManifestoutTrackCubit({
    int tmanifestoutpk,
    String trackdesc,
    double tracklat,
    String tracklocation,
    double tracklong,
    String tracktime,
  }) async {
    final Either<AppError, String> eitherResponse =
        await insertManifestoutTrack(TmanifestouttrackRequestParams(
      tmanifestoutpk: tmanifestoutpk,
      trackdesc: trackdesc,
      tracklat: tracklat,
      tracklocation: tracklocation,
      tracklong: tracklong,
      tracktime: tracktime,
    ));

    emit(eitherResponse.fold(
      (l) => ManifestouttrackFailed('Error'),
      (r) => ManifestouttrackInsertSuccess('Success Insert Manifestout Track'),
    ));
  }
}
