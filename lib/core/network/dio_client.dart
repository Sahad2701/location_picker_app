import 'package:dio/dio.dart';
import 'package:location_picker_app/core/constants/app_const.dart';
import 'package:location_picker_app/core/network/api_result.dart';
import 'package:location_picker_app/core/network/dio_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: AppConst.baseUrl,
          headers: {'x-api-key': AppConst.apiKey},
        ),
      ) {
    dio.interceptors.add(DioInterceptor());
  }

  Future<ApiResult<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);

      if (response.statusCode == 200 && response.data != null) {
        return ApiResult.success(response.data);
      } else {
        final data = response.data;
        return ApiResult.failure(
          message: data?['message'] ?? 'Failed with status',
          statusCode: data?['statusCode'] ?? response.statusCode,
          error: data?['error'],
        );
      }
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is Map<String, dynamic>) {
        return ApiResult.failure(
          message: data['message'] ?? e.message,
          statusCode: data['statusCode'] ?? e.response?.statusCode,
          error: data['error'],
        );
      } else {
        return ApiResult.failure(
          message: e.message ?? 'Dio error',
          statusCode: e.response?.statusCode,
        );
      }
    } catch (e) {
      return ApiResult.failure(message: 'Unexpected error: ${e.toString()}');
    }
  }
}
