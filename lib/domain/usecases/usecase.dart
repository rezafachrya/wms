part of 'usecases.dart';

/*
Type - what does the UseCase return (output)
Params - what is required to call API (input)
*/
abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
