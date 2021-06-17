part of 'repository_impls.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteDataSource,
    this._authenticationLocalDataSource,
  );

  @override
  Future<Either<AppError, UserEntity>> loginUser(
      Map<String, dynamic> params) async {
    try {
      final userResult =
          await _authenticationRemoteDataSource.loginUser(params);

      final users = await _authenticationLocalDataSource.readUser();
      if (users.isEmpty) {
        await _authenticationLocalDataSource.saveUser(params);
      }

      return Right(userResult.value);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<UserTable>>> getLocalUser() async {
    try {
      final userResult = await _authenticationLocalDataSource.readUser();
      return Right(userResult);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, int>> deleteUsers() async {
    try {
      final response = await _authenticationLocalDataSource.deleteUser();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
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
