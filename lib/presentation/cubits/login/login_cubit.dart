import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qrscan/common/constants/constants.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';
import 'package:qrscan/presentation/cubits/loading/loading_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final LoadingCubit loadingCubit;
  final DeleteUsers deleteUsers;

  LoginCubit({
    required this.loginUser,
    required this.loadingCubit,
    required this.deleteUsers,
  }) : super(LoginInitial());

  void initiateLogin(String userid, String password) async {
    loadingCubit.show();
    final Either<AppError, UserEntity> eitherResponse =
        await loginUser(LoginRequestParams(
      userid: userid,
      password: password,
    ));

    emit(eitherResponse.fold(
      (l) {
        var message = getErrorMessage(l.appErrorType);
        print(message);
        return LoginError(message);
      },
      (user) => LoginSuccess(user),
    ));
    loadingCubit.hide();
  }

  void deleteUser() async {
    await deleteUsers(NoParams());
    emit(LogoutSuccess());
  }

  // void initiateLogin(String token) async {
  //   loadingCubit.show();
  //   final Either<AppError, UserEntity> eitherResponse =
  //       await loginUser(LoginRequestParams(
  //     token: token,
  //   ));

  //   emit(eitherResponse.fold(
  //     (l) {
  //       var message = getErrorMessage(l.appErrorType);
  //       print(message);
  //       return LoginError(message);
  //     },
  //     (user) => LoginSuccess(user),
  //   ));
  //   loadingCubit.hide();
  // }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      // case AppErrorType.notFound:
      //   return
      case AppErrorType.network:
        return SharedString.noNetwork;
      case AppErrorType.api:
      case AppErrorType.database:
        return SharedString.somethingWentWrong;
      case AppErrorType.sessionDenied:
        return SharedString.sessionDenied;
      default:
        return SharedString.wrongUsernamePassword;
    }
  }
}
