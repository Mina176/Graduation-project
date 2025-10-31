import 'dart:convert';

import 'package:graduation_project/services/storage_helper/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MessageType {
  sent,
  received;
}

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

  Future<void> saveName(String name) async {
    await _safePrefs.setString('name', name);
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

// start from here:
  Future<void> saveMessage(Message message, {required MessageType type}) async {
    final messages = await loadMessages(type: type);
    messages.add(message);

    // 1. Convert each Message to a Map using toJson()
    final List<Map<String, dynamic>> messageMaps = messages.map((msg) {
      return msg.toMap();
    }).toList();

    // 2. Encode the List<Map> into a single JSON String
    final String jsonString = jsonEncode(messageMaps);

    // 3. Save the JSON String to SharedPreferences
    await _safePrefs.setString(type.name, jsonString);
    print(jsonString);
  }

  // --- Load List<Message> ---
  Future<List<Message>> loadMessages({required MessageType type}) async {
    await Future.delayed(Duration(seconds: 1));
    print('hello');

    // 1. Get the JSON String from SharedPreferences
    final String? jsonString = _safePrefs.getString(type.name);

    // If no data is stored, return an empty list
    if (jsonString == null) {
      return [];
    }

    try {
      // 2. Decode the JSON String into a List<dynamic>
      final List<dynamic> jsonList = jsonDecode(jsonString);

      // 3. Convert the List<dynamic> (maps) back to List<Message>
      final List<Message> messages = jsonList.map((jsonMap) {
        return Message.fromMap(jsonMap);
      }).toList();

      return messages;
    } catch (e) {
      // If decoding fails, return an empty list or handle the error
      print('Error decoding messages: $e');
      return [];
    }
  }
}
// add some print to know if the funtions is working
