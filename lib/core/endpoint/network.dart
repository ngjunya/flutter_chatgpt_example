import 'dart:io';

import 'package:dio/dio.dart';
import 'package:example/core/error/network_failure.dart';

import '../util/enum.dart';

class ApiEndpoint {
  String? baseUrl;
  ApiType? type;
  String? path;
  dynamic body;
  String? apiKey;

  ApiEndpoint({
    this.baseUrl,
    this.type,
    this.path,
    this.apiKey,
    this.body,
  });

  Future<Map<String, dynamic>> callApi(Dio dio) async {
    late Response response;

    try {
      response = await call(dio, type ?? ApiType.apiGet, path ?? "", body);
    } on DioException catch (_) {
      throw const NetworkFailure.serverError();
    }

    Map<String, dynamic> data = response.data;

    return data;
  }

  Future<Response<T>> call<T>(
      Dio dio, ApiType type, String path, dynamic body) async {
    switch (type) {
      case ApiType.apiGet:
        return dio.get(path);

      case ApiType.apiPut:
        return dio.put(path, data: body);

      case ApiType.apiPost:
        return dio.post(path, data: body);

      case ApiType.apiDelete:
        return dio.delete(path, data: body);

      default:
        return dio.get(path);
    }
  }
}

class DioConfiguration {
  Future<Dio> getClient({
    String? baseUrl,
    required bool retry,
    Map<String, dynamic>? params,
    dynamic body,
    String? apiKey,
  }) async {
    final options = BaseOptions(
      baseUrl: baseUrl ?? "",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${apiKey ?? ""}",
      },
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) {
        return status! < 300 || status == 400;
      },
      queryParameters: params,
    );
    final dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: (object) => print(object.toString()),
    ));

    return dio;
  }
}
