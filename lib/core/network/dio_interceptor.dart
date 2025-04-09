import 'package:dio/dio.dart';

import 'dart:developer';
import 'package:flutter/foundation.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      log('──────────────────────────────────────────────────');
      log('[API REQUEST] => [${options.method}] ${options.uri}');
      log('[HEADERS] => ${options.headers}');
      if (options.data != null) {
        log('[BODY] => ${options.data}');
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        '[API RESPONSE] => [${response.statusCode}] ${response.requestOptions.uri}',
      );
      log('[DATA] => ${response.data}');
      log('──────────────────────────────────────────────────');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        '[API ERROR] => [${err.response?.statusCode}] ${err.requestOptions.uri}',
      );
      log('[MESSAGE] => ${err.message}');
      if (err.response?.data != null) {
        log('[ERROR BODY] => ${err.response?.data}');
      }
      log('──────────────────────────────────────────────────');
    }
    super.onError(err, handler);
  }
}
