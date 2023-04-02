import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  //
  static SharedPreferencesManager? _sharedPreferencesManager;
  static SharedPreferences? _sharedPreferences;

  SharedPreferencesManager._() {
    print('SharedPreferencesManager constructor 2');
    _getSharedPreferences();
  }

  factory SharedPreferencesManager() {
    if (_sharedPreferencesManager == null) {
      print('SharedPreferencesManager factory constructor null 1');
      _sharedPreferencesManager = SharedPreferencesManager._();
    }
    print('SharedPreferencesManager factory constructor not null 3');
    return _sharedPreferencesManager!;
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    if (_sharedPreferences == null) {
      print('SharedPreferences object null 4');
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    print('SharedPreferences object not null 5');
    return _sharedPreferences!;
  }

  static Future<bool> putString(
      {required String key, required String value}) async {
    await _sharedPreferences?.setString(key, value);
    if (getString(key: key) != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> putBoolean(
      {required String key, required bool value}) async {
    await _sharedPreferences?.setBool(key, value);
    if (getBoolean(key: key) != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> putInteger(
      {required String key, required int value}) async {
    await _sharedPreferences?.setInt(key, value);
    if (getInteger(key: key) != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> putDouble(
      {required String key, required double value}) async {
    await _sharedPreferences?.setDouble(key, value);
    if (getDouble(key: key) != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> putStringList(
      {required String key, required List<String> value}) async {
    await _sharedPreferences?.setStringList(key, value);
    if (getStringList(key: key) != null) {
      return true;
    } else {
      return false;
    }
  }

  static String? getString({required String key}) {
    return _sharedPreferences?.getString(key);
  }

  static bool? getBoolean({required String key}) {
    return _sharedPreferences?.getBool(key);
  }

  static int? getInteger({required String key}) {
    return _sharedPreferences?.getInt(key);
  }

  static double? getDouble({required String key}) {
    return _sharedPreferences?.getDouble(key);
  }

  static List<String>? getStringList({required String key}) {
    return _sharedPreferences?.getStringList(key);
  }

  static Object? getObject({required String key}) {
    return _sharedPreferences?.get(key);
  }

  static Set<String> getAllKey() {
    return _sharedPreferences!.getKeys();
  }

  static bool isKeyExist({required String key}) {
    return _sharedPreferences!.containsKey(key);
  }

  static Future<bool> removeKey({required String key}) async {
    await _sharedPreferences?.remove(key);
    if (isKeyExist(key: key)) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> clearSharedPref() async {
    await _sharedPreferences?.clear();
    if (getAllKey().isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
