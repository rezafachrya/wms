part of 'entities.dart';

class UserEntity extends Equatable {
  final int muserpk;
  final String username;
  final String userlocname;
  final String userlocid;
  final UserLocType userloctype;
  final double userloclat;
  final double userloclong;

  UserEntity({
    required this.username,
    required this.userlocname,
    required this.muserpk,
    required this.userlocid,
    required this.userloclat,
    required this.userloclong,
    required this.userloctype,
  });

  @override
  List<Object> get props => [muserpk];
}
