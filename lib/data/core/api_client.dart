part of 'core.dart';

class ApiClient {
  final Client _client;
  // final MultipartRequest _multipartRequest;

  ApiClient(
    this._client,
    // this._multipartRequest,
  );

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    await Future.delayed(Duration(milliseconds: 500));
    final response = await _client.get(
      getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await _client
        .post(getPath(path, null), body: jsonEncode(params), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 201) {
      return 'Insert Manifestout Track Berhasil';
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic put(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.put(
      getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 204) {
      return 'Berhasil Melakukan Update';
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic send(String path, File filePath,
      {Map<dynamic, dynamic>? params}) async {
    var uriPath = getPath(path, params);
    MultipartRequest multipartRequest = MultipartRequest("POST", uriPath);
    var multiPartFile = await MultipartFile.fromPath('file', filePath.path);
    multipartRequest.files.add(multiPartFile);
    // multipartRequest.fields['staffid'] = staffid;

    final response = await multipartRequest.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return json.decode(responseBody);
    } else if (response.statusCode == 201) {
      return 'Insert Manifestout Track Berhasil';
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    //handle jika params null dengan null safety
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('${ApiConstant.BASE_URL}$path$paramsString');
    // '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}
