part of 'data_sources.dart';

abstract class ManifestRemoteDataSource {
  Future<ApiReturnValue<TmanifestoutModel>> scanQr(String qrcode);
  Future<ApiReturnValue<List<TmanifestoutitemModel>>> getManifestoutItem(
      String tmanifestoutpk);
  Future<String> updateManifestout(String tmanifestoutpk, String status);
  Future<String> insertManifestoutTrack(Map<String, dynamic> requestBody);
  Future<ApiReturnValue<List<TmanifestoutModel>>> getManifests();
  Future<ApiReturnValue<List<TmanifestoutTrackModel>>> getManifestoutTracks(
      String manifestoutpk);
}

class ManifestRemoteDataSourceImpl extends ManifestRemoteDataSource {
  final ApiClient _client;

  ManifestRemoteDataSourceImpl(this._client);

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

  @override
  Future<ApiReturnValue<List<TmanifestoutModel>>> getManifests() async {
    final response = await _client.get('manifestout');
    List<TmanifestoutModel> values = (response as Iterable)
        .map((e) => TmanifestoutModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: values);
  }

  @override
  Future<ApiReturnValue<List<TmanifestoutTrackModel>>> getManifestoutTracks(
      String manifestoutpk) async {
    final response = await _client.get('manifestouttrack/' + manifestoutpk);
    List<TmanifestoutTrackModel> values = (response as Iterable)
        .map((e) => TmanifestoutTrackModel.fromJson(e))
        .toList();
    return ApiReturnValue(value: values);
  }
}
