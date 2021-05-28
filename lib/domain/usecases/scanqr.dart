part of 'usecases.dart';

class Scanqr extends UseCase<TmanifestoutEntity, ScanqrRequestParams> {
  final ScanqrRepository _scanqrRepository;

  Scanqr(this._scanqrRepository);

  @override
  Future<Either<AppError, TmanifestoutEntity>> call(
      ScanqrRequestParams params) async {
    return await _scanqrRepository.scanQr(params.qrcode);
  }
}
