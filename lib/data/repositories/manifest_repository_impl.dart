part of 'repository_impls.dart';

class ManifestRepositoryImpl extends ManifestRepository {
  final ManifestRemoteDataSource _manifestRemoteDataSource;

  ManifestRepositoryImpl(this._manifestRemoteDataSource);

  @override
  Future<Either<AppError, TmanifestoutEntity>> scanQr(String qrcode) async {
    try {
      final tmanifestoutResult = await _manifestRemoteDataSource.scanQr(qrcode);

      return Right(tmanifestoutResult.value);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<TmanifestoutitemEntity>>> getTmanifestoutitem(
      String tmanifestoutpk) async {
    try {
      final tmanifestoutItems =
          await _manifestRemoteDataSource.getManifestoutItem(tmanifestoutpk);

      return Right(tmanifestoutItems.value);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String>> updateManifestout(
      String tmanifestoutpk, String status) async {
    try {
      final value = await _manifestRemoteDataSource.updateManifestout(
          tmanifestoutpk, status);

      return Right(value);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, String>> insertManifestoutTrack(
      Map<String, dynamic> body) async {
    try {
      final values =
          await _manifestRemoteDataSource.insertManifestoutTrack(body);
      print('ini valuenyaaaa');
      print(values);

      return Right(values);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<TmanifestoutEntity>>> getManifestouts() async {
    try {
      final values = await _manifestRemoteDataSource.getManifests();
      return Right(values.value);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<TmanifestoutTrackEntity>>> getManifestoutTracks(
      String tmanifestoutpk) async {
    try {
      final values =
          await _manifestRemoteDataSource.getManifestoutTracks(tmanifestoutpk);
      return Right(values.value);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
