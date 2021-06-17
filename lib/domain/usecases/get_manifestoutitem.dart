part of 'usecases.dart';

class GetManifestoutitem extends UseCase<List<TmanifestoutitemEntity>,
    TmanifestoutitemRequestParams> {
  final ManifestRepository scanqrRepository;

  GetManifestoutitem(this.scanqrRepository);

  @override
  Future<Either<AppError, List<TmanifestoutitemEntity>>> call(
      TmanifestoutitemRequestParams params) async {
    return await scanqrRepository.getTmanifestoutitem(params.tmanifestoutpk);
  }
}
