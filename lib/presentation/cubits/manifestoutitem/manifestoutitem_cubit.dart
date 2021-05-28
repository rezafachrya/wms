import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';

part 'manifestoutitem_state.dart';

class ManifestoutitemCubit extends Cubit<ManifestoutitemState> {
  final GetManifestoutitem getManifestoutitem;

  ManifestoutitemCubit({
    @required this.getManifestoutitem,
  }) : super(ManifestoutitemInitial());

  void loadManifestoutitem(String tmanifestoutpk) async {
    Either<AppError, List<TmanifestoutitemEntity>> eitherResponse =
        await getManifestoutitem(
            TmanifestoutitemRequestParams(tmanifestoutpk: tmanifestoutpk));

    emit(eitherResponse.fold(
      (l) => ManifestoutitemError(),
      (r) => ManifestoutitemSuccess(mitems: r),
    ));
  }
}
