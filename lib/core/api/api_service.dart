import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'interceptor.dart';

class APIService {
  final Dio _dio;

  APIService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: dotenv.env['API_URL'] ?? '',
              validateStatus: (status) => true,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              headers: {'Content-Type': 'application/json'},
            ),
          ) {
    _dio.interceptors.add(LoggingInterceptor());
  }

  // GET METHOD
  Future<Response<dynamic>> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);

      return response;
    } on DioException catch (e) {
      throw Exception('Dio GET Exception failed : ${e.message}');
    } catch (e) {
      throw Exception('GET Error : $e');
    }
  }

  // POST METHOD
  Future<Response<dynamic>> postData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      return response;
    } on DioException catch (e) {
      throw Exception('Dio POST Exception failed : ${e.message}');
    } catch (e) {
      throw Exception('POST Error : $e');
    }
  }
}
