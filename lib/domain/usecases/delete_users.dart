part of 'usecases.dart';

class DeleteUsers extends UseCase<int, NoParams> {
  final AuthenticationRepository authenticationRepository;
  DeleteUsers(
    this.authenticationRepository,
  );

  @override
  Future<Either<AppError, int>> call(NoParams params) async {
    return await authenticationRepository.deleteUsers();
  }
}
