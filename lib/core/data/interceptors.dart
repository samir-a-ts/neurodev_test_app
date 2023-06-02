import 'package:dio/dio.dart';

import '../domain/error_code.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ErrorCode? code;

    if (err.type == DioErrorType.connectionError) {
      code = ErrorCode.noInternet;
    }

    code ??= ErrorCode.requestFailed;

    handler.reject(
      err.copyWith(
        error: code,
      ),
    );
  }
}
