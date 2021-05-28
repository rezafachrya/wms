part of 'repository_impls.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteDataSource,
  );

  @override
  Future<Either<AppError, UserEntity>> loginUser(
      Map<String, dynamic> params) async {
    try {
      final userResult =
          await _authenticationRemoteDataSource.loginUser(params);
      if (userResult.value != null) {
        return Right(userResult.value);
      }
      return Left(AppError(AppErrorType.notFound));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  // @override
  // Future<Either<AppError, UserEntity>> loginUser(String params) async {
  // try {
  //   final userResult =
  //       await _authenticationRemoteDataSource.loginUser(params);
  //   if (userResult.value != null) {
  //     return Right(userResult.value);
  //   }
  //   return Left(AppError(AppErrorType.notFound));
  // } on SocketException {
  //   return Left(AppError(AppErrorType.network));
  // } on UnauthorisedException {
  //   return Left(AppError(AppErrorType.unauthorised));
  // } on Exception {
  //   return Left(AppError(AppErrorType.api));
  // }
  // }
}
