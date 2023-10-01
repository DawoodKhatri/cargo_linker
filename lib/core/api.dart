import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  final String baseUrl = "http://localhost:5000";
  final Map<String, dynamic> defaultHeaders = {
    "Content-Type": "application/json"
  };
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.headers = defaultHeaders;
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  Dio get request => _dio;
}

class ApiResopnse {
  bool success;
  String? message;
  dynamic data;

  ApiResopnse({required this.success, this.message, this.data});

  factory ApiResopnse.fromResponse(Response response) {
    final res = response.data as Map<String, dynamic>;
    return ApiResopnse(
      success: res["success"],
      message: res["message"] ?? res["success"] ? "Success" : "Error",
      data: res["data"],
    );
  }
}
