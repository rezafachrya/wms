import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';
import 'package:qrscan/presentation/cubits/loading/loading_cubit.dart';
import 'package:qrscan/presentation/cubits/manifestoutitem/manifestoutitem_cubit.dart';
import 'package:qrscan/presentation/cubits/manifestouttrack/manifestouttrack_cubit.dart';

part 'scanqr_state.dart';

class ScanqrCubit extends Cubit<ScanqrState> {
  final Scanqr scanqr;
  final ManifestoutitemCubit manifestoutitemCubit;
  final ManifestouttrackCubit manifestouttrackCubit;
  final LoadingCubit loadingCubit;

  ScanqrCubit({
    required this.scanqr,
    required this.loadingCubit,
    required this.manifestoutitemCubit,
    required this.manifestouttrackCubit,
  }) : super(ScanqrInitial());

  void scanQrCode(String qrcode) async {
    loadingCubit.show();
    String tmanifestoutpk = '';
    final Either<AppError, TmanifestoutEntity> eitherResponse =
        await scanqr(ScanqrRequestParams(
      qrcode: qrcode,
    ));

    emit(eitherResponse.fold(
      (l) => ScanqrFailed('Error'),
      (tmanifestout) {
        tmanifestoutpk = tmanifestout.tmanifestoutpk.toString();
        return ScanqrSuccess(tmanifestout);
      },
    ));

    manifestoutitemCubit.loadManifestoutitem(tmanifestoutpk);
    manifestouttrackCubit.loadManifestoutTracks(tmanifestoutpk);
    loadingCubit.hide();
  }
}
