part of 'usecases.dart';

class InsertManifestoutTrack
    extends UseCase<String, TmanifestouttrackRequestParams> {
  final ScanqrRepository _scanqrRepository;

  InsertManifestoutTrack(this._scanqrRepository);

  @override
  Future<Either<AppError, String>> call(
      TmanifestouttrackRequestParams params) async {
    return await _scanqrRepository.insertManifestoutTrack(params.toJson());
  }
}
