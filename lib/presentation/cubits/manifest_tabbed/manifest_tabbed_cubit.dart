import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';

part 'manifest_tabbed_state.dart';

class ManifestTabbedCubit extends Cubit<ManifestTabbedState> {
  final GetManifestouts getManifestouts;
  ManifestTabbedCubit({required this.getManifestouts})
      : super(ManifestTabbedInitial());

  void manifestTabChanged({int currentTabIndex = 0}) async {
    emit(ManifestTabLoading(currentTabIndex: currentTabIndex));
    Either<AppError, List<TmanifestoutEntity>> manifestEither =
        await getManifestouts(NoParams());
    // late Either<AppError, List<TmanifestoutEntity>> manifestFilter;
    switch (currentTabIndex) {
      case 0:
        emit(manifestEither.fold(
            (l) => ManifestTabLoadError(
                  currentTabIndex: currentTabIndex,
                  errorType: l.appErrorType,
                ),
            (r) => ManifestTabChanged(
                currentTabIndex: currentTabIndex,
                manifests:
                    r.where((element) => element.status == 'PC').toList())));
        break;
      case 1:
        emit(manifestEither.fold(
            (l) => ManifestTabLoadError(
                  currentTabIndex: currentTabIndex,
                  errorType: l.appErrorType,
                ),
            (r) => ManifestTabChanged(
                currentTabIndex: currentTabIndex,
                manifests:
                    r.where((element) => element.status == 'DL').toList())));
        break;
      case 2:
        emit(manifestEither.fold(
            (l) => ManifestTabLoadError(
                  currentTabIndex: currentTabIndex,
                  errorType: l.appErrorType,
                ),
            (r) => ManifestTabChanged(
                currentTabIndex: currentTabIndex,
                manifests:
                    r.where((element) => element.status == 'DN').toList())));
        break;
      case 3:
        emit(manifestEither.fold(
            (l) => ManifestTabLoadError(
                  currentTabIndex: currentTabIndex,
                  errorType: l.appErrorType,
                ),
            (r) => ManifestTabChanged(
                currentTabIndex: currentTabIndex,
                manifests:
                    r.where((element) => element.status == 'BA').toList())));
        break;
    }
    // emit(moviesEither.fold(
    //   (l) => MovieTabLoadError(
    //     currentTabIndex: currentTabIndex,
    //     errorType: l.appErrorType,
    //   ),
    //   (movies) {
    //     return MovieTabChanged(
    //       currentTabIndex: currentTabIndex,
    //       movies: movies,
    //     );
    //   },
    // ));
  }
}
