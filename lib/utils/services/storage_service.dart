import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:restaurant/models/register_user/register_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const tokenKey = 'token_key';
const userDataKey = 'user_key';
const userNameKey = 'username_key';
const isFBKey = 'is_fb_key';
const notFoundPref = 'not found';

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  // String _getString(String key) => _prefs.getString(key) ?? notFoundPref;
  //
  // bool _getBool(String key) => _prefs.getBool(key) ?? false;
  //
  // Future<bool> _setString(String key, String value) async =>
  //     await _prefs.setString(key, value);
  //
  // Future<bool> _setBool(String key, bool isDarkTheme) async =>
  //     await _prefs.setBool(key, isDarkTheme);

  // ------------- getters
  String get token => _prefs.getString(tokenKey) ?? '';

  RegisterUser? get userData {
    final userStr = _prefs.getString(userDataKey) ?? '';
    return userStr.isNotEmpty
        ? RegisterUser.fromJson(jsonDecode(userStr))
        : null;
  }

  String? get userName => _prefs.getString(userNameKey) ?? '';

  bool get isFb => _prefs.getBool(isFBKey) ?? false;
  // ------------- end getters

  // ------------- setters
  Future<void> setToken(String token) async =>
      await _prefs.setString(tokenKey, token);

  Future<void> setUserData(RegisterUser user) async {
    Fimber.i('user data saved');
    final userStr = jsonEncode(user.toJson());
    await _prefs.setString(userDataKey, userStr);
  }

  Future<void> setUserName(String userName) async =>
      await _prefs.setString(userNameKey, userName);

  Future<void> setIsFb(bool value) async =>
      await _prefs.setBool(isFBKey, value);

  // ------------- end setters

}
