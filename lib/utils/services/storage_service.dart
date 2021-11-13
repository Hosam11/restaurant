import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const tokenKey = 'token_key';
const notFoundPref = 'not found';

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  String get token {
    return _prefs.getString(tokenKey) ?? '';
  }

  Future<void> setToken(String token) async =>
      await _prefs.setString(tokenKey, token);

  static Future<StorageService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  String getString(String key) => _prefs.getString(key) ?? notFoundPref;
  bool getBool(String key) => _prefs.getBool(key) ?? false;

  Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  Future<bool> setBool(String key, bool isDarkTheme) async =>
      await _prefs.setBool(key, isDarkTheme);
}
