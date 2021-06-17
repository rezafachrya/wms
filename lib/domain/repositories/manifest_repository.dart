part of 'repositories.dart';

abstract class ManifestRepository {
  Future<Either<AppError, TmanifestoutEntity>> scanQr(String qrcode);
  Future<Either<AppError, List<TmanifestoutitemEntity>>> getTmanifestoutitem(
      String tmanifestoutpk);
  Future<Either<AppError, String>> updateManifestout(
      String tmanifestoutpk, String status);
  Future<Either<AppError, String>> insertManifestoutTrack(
      Map<String, dynamic> params);
  Future<Either<AppError, List<TmanifestoutEntity>>> getManifestouts();
  Future<Either<AppError, List<TmanifestoutTrackEntity>>> getManifestoutTracks(
      String tmanifestoutpk);
}
