import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  StorageHelper._internal();

  static final StorageHelper _instance = StorageHelper._internal();

  factory StorageHelper() {
    return _instance;
  }

  SharedPreferences? _prefs;
  static const _isLoggedInKey = 'isLoggedIn';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Throws an error if init() hasn't been called.
  /// use _safePrefs to access SharedPreferences safely.
  SharedPreferences get _safePrefs {
    if (_prefs == null) {
      throw Exception(
          "SharedPreferences not initialized. Call PrefsService().init() in main() first.");
    }
    return _prefs!;
  }

  Future<void> saveName(String name) async {
    await _safePrefs.setString('name', name);
  }

  Future<void> saveMessage(String message) async {
    await _safePrefs.setString('message', message);
  }

  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _safePrefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  String loadName() {
    return _safePrefs.getString('name') ?? 'Unknown';
  }

  bool isLoggedIn() {
    return _safePrefs.getBool(_isLoggedInKey) ?? false;
  }
}
