part of 'repository_impls.dart';

class ScanqrRepositoryImpl extends ScanqrRepository {
  final ScanqrRemoteDataSource _scanqrRemoteDataSource;

  ScanqrRepositoryImpl(this._scanqrRemoteDataSource);

  @override
  Future<Either<AppError, TmanifestoutEntity>> scanQr(String qrcode) async {
    try {
      final tmanifestoutResult = await _scanqrRemoteDataSource.scanQr(qrcode);
      if (tmanifestoutResult.value != null) {
        return Right(tmanifestoutResult.value);
      }
      return Left(AppError(AppErrorType.notFound));
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
          await _scanqrRemoteDataSource.getManifestoutItem(tmanifestoutpk);
      if (tmanifestoutItems.value != null) {
        return Right(tmanifestoutItems.value);
      }
      return Left(AppError(AppErrorType.notFound));
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
      final value = await _scanqrRemoteDataSource.updateManifestout(
          tmanifestoutpk, status);
      if (value != null) {
        return Right(value);
      }
      return Left(AppError(AppErrorType.notFound));
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
      final values = await _scanqrRemoteDataSource.insertManifestoutTrack(body);
      print('ini valuenyaaaa');
      print(values);
      if (values != null) {
        return Right(values);
      }
      return Left(AppError(AppErrorType.notFound));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
