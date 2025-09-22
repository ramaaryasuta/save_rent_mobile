import 'package:dio/dio.dart';

import '../../utils/print_log.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Cetak method dan URL sebelum request jalan
    // printLog(
    //   "${options.method.toUpperCase()} '${options.baseUrl}${options.path}'",
    // );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogType logType = LogType.general;

    switch (response.statusCode) {
      case 200:
        logType = LogType.success;
        break;
      default:
        logType = LogType.error;
        break;
    }
    printLog(
      "${response.requestOptions.method.toUpperCase()} (${response.statusCode}) ${response.realUri}",
      type: logType,
    );

    // print log if status code is not 500
    if (response.statusCode == 500) {
      printLog('Error: ${response.data}', type: LogType.error);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Cetak error status code dan URL
    final statusCode = err.response?.statusCode;
    final method = err.requestOptions.method.toUpperCase();
    final uri = err.requestOptions.uri;
    printLog('⛔ ERROR $statusCode $method $uri');
    if (err.response?.data != null) {
      printLog('Error Body: ${err.response?.data}');
    }
    super.onError(err, handler);
  }
}
