part of 'autologin_cubit.dart';

abstract class AutologinState extends Equatable {
  const AutologinState();

  @override
  List<Object> get props => [];
}

class AutologinInitial extends AutologinState {}

class AutologinLoading extends AutologinState {}

class AutologinSuccess extends AutologinState {
  final List<UserTable> userTables;

  AutologinSuccess({
    required this.userTables,
  });

  @override
  List<Object> get props => [userTables];
}

class AutologinError extends AutologinState {}
