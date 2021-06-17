import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';
import 'package:qrscan/presentation/cubits/loading/loading_cubit.dart';

part 'manifestout_state.dart';

class ManifestoutCubit extends Cubit<ManifestoutState> {
  final UpdateTmanifestout updateTmanifestout;
  final LoadingCubit loadingCubit;

  ManifestoutCubit({
    required this.updateTmanifestout,
    required this.loadingCubit,
  }) : super(ManifestoutInitial());

  Future<void> updateManifestout(String tmanifestoutpk, String status) async {
    loadingCubit.show();
    final Either<AppError, String> eitherResponse =
        await updateTmanifestout(UpdateManifestoutParams(
      tmanifestoutpk: tmanifestoutpk,
      status: status,
    ));

    emit(eitherResponse.fold(
      (l) => UpdateManifestoutFailed('Error'),
      (r) => UpdateManifestoutSuccess(r),
    ));

    loadingCubit.hide();
  }
}
