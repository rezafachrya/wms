part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity userEntity;

  LoginSuccess(this.userEntity);

  @override
  List<Object> get props => [userEntity];
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);

  @override
  List<Object> get props => [message];
}

class LogoutSuccess extends LoginState {}
