import 'package:cargo_linker/core/api.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final Api _api = Api();

  Future<void> registerUser() async {
    try {
      Response response = await _api.request.get("/");
      ApiResopnse apiResopnse = ApiResopnse.fromResponse(response);

      if (!apiResopnse.success) {
        throw apiResopnse.message.toString();
      }
    } catch (ex) {
      rethrow;
    }
  }
}
