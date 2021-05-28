part of 'entities.dart';

class LoginRequestParams {
  // final String token;
  final String userid;
  final String password;

  LoginRequestParams({
    // @required this.token,
    @required this.userid,
    @required this.password,
  });

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'password': password,
      };
}
