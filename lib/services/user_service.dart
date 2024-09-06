import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/models/user.dart';
import 'dart:convert';

class UserService {
  static const String _userKey = 'user';

  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = jsonEncode(user.toMap());
    await prefs.setString(_userKey, userData);
  }

  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString(_userKey);
    if (userData != null) {
      Map<String, dynamic> userMap = jsonDecode(userData);
      return User.fromMap(userMap);
    }
    return null;
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}