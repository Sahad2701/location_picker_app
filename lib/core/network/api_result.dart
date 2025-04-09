sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = ApiSuccess<T>;

  factory ApiResult.failure({
    required String message,
    int? statusCode,
    String? error,
  }) = ApiFailure<T>;
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final String message;
  final int? statusCode;
  final String? error;

  const ApiFailure({required this.message, this.statusCode, this.error});
}
