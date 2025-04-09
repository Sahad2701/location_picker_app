sealed class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = ApiSuccess<T>;

  factory ApiResult.failure({
    required String message,
    int? statusCode,
    String? error,
  }) = ApiFailure<T>;

  bool get isSuccess => this is ApiSuccess<T>;

  bool get isFailure => this is ApiFailure<T>;

  T? get data => this is ApiSuccess<T> ? (this as ApiSuccess<T>).data : null;

  String? get message =>
      this is ApiFailure<T> ? (this as ApiFailure<T>).message : null;

  int? get statusCode =>
      this is ApiFailure<T> ? (this as ApiFailure<T>).statusCode : null;

  String? get error =>
      this is ApiFailure<T> ? (this as ApiFailure<T>).error : null;
}

class ApiSuccess<T> extends ApiResult<T> {
  @override
  final T data;

  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  @override
  final String message;
  @override
  final int? statusCode;
  @override
  final String? error;

  const ApiFailure({required this.message, this.statusCode, this.error});
}
