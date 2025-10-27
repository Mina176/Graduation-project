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
  SharedPreferences get _safePrefs {
    if (_prefs == null) {
      throw Exception(
          "SharedPreferences not initialized. Call PrefsService().init() in main() first.");
    }
    return _prefs!;
  }

  void saveName(String name) {
    _safePrefs.setString('name', name);
  }

  void setLoggedIn(bool isLoggedIn) {
    _safePrefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  String loadName() {
    return _safePrefs.getString('name') ?? 'Unknown';
  }

  bool isLoggedIn() {
    return _safePrefs.getBool(_isLoggedInKey) ?? false;
  }
}
