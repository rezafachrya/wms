part of 'repositories.dart';

abstract class ScanqrRepository {
  Future<Either<AppError, TmanifestoutEntity>> scanQr(String qrcode);
  Future<Either<AppError, List<TmanifestoutitemEntity>>> getTmanifestoutitem(
      String tmanifestoutpk);
  Future<Either<AppError, String>> updateManifestout(
      String tmanifestoutpk, String status);
  Future<Either<AppError, String>> insertManifestoutTrack(
      Map<String, dynamic> params);
}
