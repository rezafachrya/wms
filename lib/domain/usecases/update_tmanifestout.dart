part of 'usecases.dart';

class UpdateTmanifestout extends UseCase<String, UpdateManifestoutParams> {
  final ManifestRepository scanqrRepository;

  UpdateTmanifestout(this.scanqrRepository);

  @override
  Future<Either<AppError, String>> call(UpdateManifestoutParams params) async {
    return await scanqrRepository.updateManifestout(
        params.tmanifestoutpk, params.status);
  }
}
