import 'dart:convert';

import 'package:tarwati/core/services/secure_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final SecureStorageService _secureStorage;
  final Dio dio;
  DioClient(this._secureStorage) : dio = Dio() {
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['X-Api-Key'] = 'NosghGUNyWMA20szyOBJ1deUay';
    dio.options.followRedirects = false;
    dio.options.maxRedirects = 0;
    dio.options.receiveDataWhenStatusError = true;
    dio.options.validateStatus = (status) {
      return status != null && status >= 200 && status < 300 || status == 304;
    };

    dio.interceptors.add(JsonContentTypeInterceptor());
    dio.interceptors.add(LocaleInterceptor());
    dio.interceptors.add(TokenInterceptor(_secureStorage));
    dio.interceptors.add(Response204Interceptor());
    dio.interceptors.add(CustomEncodingInterceptor());

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
      ),
    );
    dio.transformer = BackgroundTransformer()
      ..jsonDecodeCallback = (String json) {
        if (json.isEmpty) {
          return null; // Return null for empty responses
        }
        return jsonDecode(json);
      };
  }
}

/// Sets Content-Type to application/json when body is Map or List so Dio
/// does not try to imply it (avoids "cannot be used to imply a default content-type").
class JsonContentTypeInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final data = options.data;
    if (data is! FormData && (data is Map || data is List)) {
      options.headers['Content-Type'] = 'application/json';
    }
    super.onRequest(options, handler);
  }
}

class LocaleInterceptor extends Interceptor {
  LocaleInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Accept-Language'] = Preferences.getLocale() ?? 'ar';
    options.headers['Accept-Language'] = 'ar';
    super.onRequest(options, handler);
  }
}

class TokenInterceptor extends Interceptor {
  TokenInterceptor(this._storage);
  final SecureStorageService _storage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(SecureStorageEnum.token.name);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token is expired or invalid
      // SecureStorageService.delete(SecureStorageEnum.token.name);
      // SecureStorageService.delete(SecureStorageEnum.userInfo.name);

      // You could attempt to refresh the token here if you have a refresh mechanism
      // If refresh is successful, retry the original request
      // For example:
      // if (await _refreshToken()) {
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
    }

    super.onError(err, handler);
  }
}

class Response204Interceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 204) {
      // Convert 204 No Content to a successful response with an empty Map<String, dynamic>
      response.data = <String, dynamic>{'status': 'success'};
    }
    super.onResponse(response, handler);
  }
}

class CustomEncodingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.queryParameters.isNotEmpty) {
      options.queryParameters = options.queryParameters.map((key, value) {
        if (value is String) {
          return MapEntry(key, value.replaceAll('|', '%7C'));
        }
        return MapEntry(key, value);
      });
    }
    super.onRequest(options, handler);
  }
}
