import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  /// Set a string value in SharedPreferences
  static Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// Get a string value from SharedPreferences
  static Future<String?> getString(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      return null;
    }
  }

  /// Set a boolean value in SharedPreferences
  static Future<void> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  /// Get a boolean value from SharedPreferences
  static Future<bool?> getBool(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(key);
    } catch (e) {
      return null;
    }
  }

  /// Set an integer value in SharedPreferences
  static Future<void> setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  /// Get an integer value from SharedPreferences
  static Future<int?> getInt(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getInt(key);
    } catch (e) {
      return null;
    }
  }

  /// Set a double value in SharedPreferences
  static Future<void> setDouble(String key, double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  /// Get a double value from SharedPreferences
  static Future<double?> getDouble(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(key);
    } catch (e) {
      return null;
    }
  }

  /// Remove a specific key from SharedPreferences
  static Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  /// Clear all data from SharedPreferences
  static Future<void> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
