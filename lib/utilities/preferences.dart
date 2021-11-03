import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';


mixin Preferences {
  static SharedPreferences? _preference;

  static Future<SharedPreferences> get instance => SharedPreferences.getInstance().then((value) => _preference = value);

  static Future<bool> setString(String key, String value) {
    return _preference!.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    return _preference!.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    return _preference!.setDouble(key, value);
  }

  static Future<bool> setBool(String key, value) {
    return _preference!.setBool(key, value);
  }

  static String getString(String key) {
    return _preference!.getString(key) ?? '';
  }

  static int? getInt(String key) {
    return _preference!.getInt(key);
  }

  static bool? getBool(String key) {
    return _preference!.getBool(key);
  }

  static double? getDouble(String key) {
    return _preference!.getDouble(key);
  }

  static Future<bool> remove(String key) {
    return _preference!.remove(key);
  }

  static bool containsKey(String key) {
    return _preference!.containsKey(key);
  }

  static Future<bool> clear() {
    return _preference!.clear();
  }

  static Map getAllKeyValuePair() {
    final keys = _preference!.getKeys();
    final prefsMap = <String, dynamic>{};
    for(final key in keys) {
      prefsMap[key] = _preference!.get(key);
    }
    return prefsMap;
  }

}