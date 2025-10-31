
import 'package:cryptography/cryptography.dart';
import 'package:graduation_project/services/storage_helper/storage_helper.dart';

class KeyProvider {
  // Private constructor
  KeyProvider._internal();

  // Static instance
  static KeyProvider? _instance;

  // Factory constructor — builds automatically if needed
  factory KeyProvider() {
    _instance ??= KeyProvider._build();
    return _instance!;
  }

  // Example property (no default value)
  late SecretKey? data;

  /// Private build method called automatically when first accessed
  static KeyProvider _build() {
    final instance = KeyProvider._internal();
    instance.data = StorageHelper().loadPassword();
    return instance;
  }

  //update data
  void updateData(SecretKey? newData) {
    data = newData;
  }
}