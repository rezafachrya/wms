part of 'usecases.dart';

class GetManifestouts extends UseCase<List<TmanifestoutEntity>, NoParams> {
  final ManifestRepository manifestRepository;
  GetManifestouts(
    this.manifestRepository,
  );

  @override
  Future<Either<AppError, List<TmanifestoutEntity>>> call(
      NoParams params) async {
    return await manifestRepository.getManifestouts();
  }
}
