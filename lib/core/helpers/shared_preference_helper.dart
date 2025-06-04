import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // private constructor to prevent instantiation
  SharedPreferenceHelper._();

  /// Remove a value from shared preferences using its key.
  static Future<void> removeData(String key) async {
    debugPrint('Removing key: $key from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Clear all data from shared preferences.
  static Future<void> clearAllData() async {
    debugPrint('Clearing all data from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Save a [value] to shared preferences with the specified [key].
  static Future<void> saveData(String key, dynamic value) async {
    debugPrint('Saving key: $key with value: $value to SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is List<String>) {
      await sharedPreferences.setStringList(key, value);
    } else {
      null;
    }
  }


  /// Get a bool value from shared preferences using its [key].
  static Future<bool?> getBool(String key) async {
    debugPrint('Getting bool for key: $key from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key);
  }


  /// Get a String value from shared preferences using its [key].
  static Future<String?> getString(String key) async {
    debugPrint('Getting String for key: $key from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  /// Get an int value from shared preferences using its [key].
  static Future<int?> getInt(String key) async {
    debugPrint('Getting int for key: $key from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key);
  }

  /// Get a double value from shared preferences using its [key].
  static Future<double?> getDouble(String key) async {
    debugPrint('Getting double for key: $key from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key);
  }

  /// Get a List[String] value from shared preferences using its [key].
  static Future<List<String>?> getList(String key) async {
    debugPrint('Getting List<String> for key: $key from SharedPreferences');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key);
  }

  /// set secured string [value] and [key] in shared preferences
  static Future<void> setSecuredString(String key, String value) async {
    debugPrint('Setting secured String for key: $key and value: $value in SharedPreferences');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// get secured string [key] from shared preferences
  static Future<String?> getSecuredString(String key) async {
    debugPrint('flutterSecureStorage: Getting secured String for key: $key from SharedPreferences');
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }


/// clear secured string [key] from shared preferences
  static Future<void> clearAllSecuredData() async {
    debugPrint('flutterSecureStorage: Clearing secured data ');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
