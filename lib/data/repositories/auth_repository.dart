import 'package:cargo_linker/core/api.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final Api _api = Api();

  Future<void> getUser() async {
    try {
      Response response = await _api.request.get("/auth/details");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
    } on DioException catch (e) {
      throw e.error.toString();
    }
  }

  Future<void> logoutUser() async {
    try {
      Response response = await _api.request.post("/auth/logout");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
    } on DioException catch (e) {
      throw e.error.toString();
    }
  }
}
