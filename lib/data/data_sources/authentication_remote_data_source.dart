part of 'data_sources.dart';

abstract class AuthenticationRemoteDataSource {
  // Future<ApiReturnValue<UserModel>> loginUser(String token);
  Future<ApiReturnValue<UserModel>> loginUser(Map<String, dynamic> requestBody);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<ApiReturnValue<UserModel>> loginUser(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      'auth',
      params: requestBody,
    );

    UserModel value = UserModel.fromJson(response);

    return ApiReturnValue(value: value);
  }

  // @override
  // Future<ApiReturnValue<UserModel>> loginUser(String token) async {
  //   final response = await _client.get('auth/admin/' + token);

  //   UserModel value = UserModel.fromJson(response);
  //   return ApiReturnValue(value: value);
  // }
}
