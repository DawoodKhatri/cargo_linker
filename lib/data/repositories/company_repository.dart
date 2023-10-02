import 'package:cargo_linker/core/api.dart';
import 'package:dio/dio.dart';

class CompanyRepository {
  final Api _api = Api();

  Future<void> companyEmailVerify(String email) async {
    try {
      Map<String, dynamic> body = {"email": email};
      Response response =
          await _api.request.post("/company/auth/verification", data: body);
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
    } on DioException catch (e) {
      throw e.error.toString();
    }
  }

  Future<void> companySignup(String email, String password, String otp) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
        "otp": otp
      };
      Response response =
          await _api.request.post("/company/auth/signup", data: body);
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
    } on DioException catch (e) {
      throw e.error.toString();
    }
  }

  Future<void> companyLogin(String email, String password) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };
      Response response =
          await _api.request.post("/company/auth/login", data: body);
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
    } on DioException catch (e) {
      throw e.error.toString();
    }
  }
}
