import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';

part 'manifestouttrack_state.dart';

class ManifestouttrackCubit extends Cubit<ManifestouttrackState> {
  final InsertManifestoutTrack insertManifestoutTrack;
  final GetManifestoutTracks getManifestoutTracks;

  ManifestouttrackCubit({
    required this.getManifestoutTracks,
    required this.insertManifestoutTrack,
  }) : super(ManifestouttrackInitial());

  void loadManifestoutTracks(String tmanifestoutpk) async {
    emit(ManifestoutTrackLoading());
    Either<AppError, List<TmanifestoutTrackEntity>> eitherResponse =
        await getManifestoutTracks(
            TmanifestoutitemRequestParams(tmanifestoutpk: tmanifestoutpk));

    emit(eitherResponse.fold(
      (l) => ManifestoutTrackLoadedFailed(),
      (r) => ManifestoutTrackLoadedSuccess(tmanifestoutTracks: r),
    ));
  }

  Future<void> insertManifestoutTrackCubit({
    required int tmanifestoutpk,
    required String trackdesc,
    required double tracklat,
    required String tracklocation,
    required double tracklong,
    required String tracktime,
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
