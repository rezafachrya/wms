import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:qrscan/data/tables/tables.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/domain/usecases/usecases.dart';

part 'autologin_state.dart';

class AutologinCubit extends Cubit<AutologinState> {
  final GetLocalUser getLocalUser;
  final DeleteUsers deleteUsers;

  AutologinCubit({
    required this.getLocalUser,
    required this.deleteUsers,
  }) : super(AutologinInitial());

  void loadLocalUser() async {
    final Either<AppError, List<UserTable>> response =
        await getLocalUser(NoParams());
    emit(
      response.fold(
        (l) => AutologinError(),
        (r) => AutologinSuccess(userTables: r),
      ),
    );
  }

  //debug state
  // @override
  // void onChange(Change<AutologinState> change) {
  //   print("current: " +
  //       change.currentState.toString() +
  //       " next: " +
  //       change.nextState.toString());
  //   super.onChange(change);
  // }

  // void deleteUser() async {
  //   await deleteUsers(NoParams());
  // }
}
