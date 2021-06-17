part of 'usecases.dart';

class GetManifestoutTracks extends UseCase<List<TmanifestoutTrackEntity>,
    TmanifestoutitemRequestParams> {
  final ManifestRepository manifestRepository;

  GetManifestoutTracks(this.manifestRepository);

  @override
  Future<Either<AppError, List<TmanifestoutTrackEntity>>> call(
      TmanifestoutitemRequestParams params) async {
    return await manifestRepository.getManifestoutTracks(params.tmanifestoutpk);
  }
}
