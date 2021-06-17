part of 'usecases.dart';

class GetLocalUser extends UseCase<List<UserTable>, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  GetLocalUser(this._authenticationRepository);

  @override
  Future<Either<AppError, List<UserTable>>> call(NoParams params) async {
    return await _authenticationRepository.getLocalUser();
  }
}
