import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  Future<String> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('userName');
    return name ?? '';
  }
}
