import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AuthPersistance {
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    log(token);
    prefs.setString("token", token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}
