part of 'repositories.dart';

abstract class AuthenticationRepository {
  // Future<Either<AppError, UserEntity>> loginUser(String params);
  Future<Either<AppError, UserEntity>> loginUser(Map<String, dynamic> params);
  Future<Either<AppError, List<UserTable>>> getLocalUser();
  Future<Either<AppError, int>> deleteUsers();
}
