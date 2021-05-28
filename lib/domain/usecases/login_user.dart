part of 'usecases.dart';

class LoginUser extends UseCase<UserEntity, LoginRequestParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<Either<AppError, UserEntity>> call(LoginRequestParams params) async {
    // return await _authenticationRepository.loginUser(params.token);
    return await _authenticationRepository.loginUser(params.toJson());
  }
}
