part of 'data_sources.dart';

abstract class ScanqrRemoteDataSource {
  Future<ApiReturnValue<TmanifestoutModel>> scanQr(String qrcode);
  Future<ApiReturnValue<List<TmanifestoutitemModel>>> getManifestoutItem(
      String tmanifestoutpk);
  Future<String> updateManifestout(String tmanifestoutpk, String status);
  Future<String> insertManifestoutTrack(Map<String, dynamic> requestBody);
}

class ScanqrRemoteDataSourceImpl extends ScanqrRemoteDataSource {
  final ApiClient _client;

  ScanqrRemoteDataSourceImpl(this._client);

  @override
  Future<ApiReturnValue<TmanifestoutModel>> scanQr(String qrcode) async {
    final response = await _client.get('manifestout/' + qrcode);

    TmanifestoutModel value = TmanifestoutModel.fromJson(response);

    return ApiReturnValue(value: value);
  }

  @override
  Future<ApiReturnValue<List<TmanifestoutitemModel>>> getManifestoutItem(
      String tmanifestoutpk) async {
    final response = await _client.get('manifestoutitem/' + tmanifestoutpk);

    List<TmanifestoutitemModel> values = (response as Iterable)
        .map((e) => TmanifestoutitemModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: values);
  }

  @override
  Future<String> updateManifestout(String tmanifestoutpk, String status) async {
    final response =
        await _client.put('manifestout/' + tmanifestoutpk + '/' + status);

    String values = response;

    return values;
  }

  @override
  Future<String> insertManifestoutTrack(
      Map<String, dynamic> requestBody) async {
    final response =
        await _client.post('manifestouttrack', params: requestBody);

    String values = response;

    return values;
  }
}
