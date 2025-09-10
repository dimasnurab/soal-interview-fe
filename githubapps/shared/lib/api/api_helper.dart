import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_exception.dart';

enum MethodApiHelper { POST, GET, DELETE, PUT }

class ApiHelper {
  late Dio dio;
  final String apiBaseUrl;
  CancelToken? _cancelToken;

  ApiHelper({required this.apiBaseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: Duration(milliseconds: 120000),
        receiveTimeout: Duration(milliseconds: 120000),
      ),
    );

    _cancelToken = CancelToken();

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
        ),
      );
    }
  }

  Future<Response> request(
    String path, {
    required MethodApiHelper method,
    service,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    String? accesToken,
    String? key,
    String? username,
  }) async {
    try {
      return await dio.request(
        path,
        queryParameters: queryParameters,
        data: data,
        options:
            options?.copyWith(method: method.name) ??
            Options(method: method.name),
        cancelToken: cancelToken ?? _cancelToken,
      );
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;

      switch (statusCode) {
        case 401:
          throw UnauthorizedException(
            message: e.response?.statusMessage ?? "Unauthorized",
          );
        case 404:
          throw NotFoundException(
            message: e.response?.statusMessage ?? "Not Found",
          );
        case 500:
          throw InternalServerException(
            message: e.response?.statusMessage ?? "Internal Server Error",
          );
        default:
          throw ApiException(
            e.response?.statusMessage ?? "unknown error",
            statusCode: statusCode,
          );
      }
    }
  }
}
