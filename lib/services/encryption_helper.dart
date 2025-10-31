import 'dart:convert';
import 'package:cryptography/cryptography.dart';

// Future encryptDataWithPassword(String password, String data) async {
//   final secretKey = await deriveKeyFromPassword(password);
//   final encryptedData = await _encryptData(secretKey, data);
//   return encryptedData;
// }

// Future<String> decryptDataWithPassword(String password, Uint8List encryptedData) async {
//   final secretKey = await deriveKeyFromPassword(password);
//   final decryptedData = await _decryptData(secretKey, encryptedData);
//   return decryptedData;
// }

class EncryptionHelper {
  static final _algorithm = AesGcm.with256bits();
  static Future<SecretKey> deriveKeyFromPassword(String password) async {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: 10000,
      bits: 256,
    );

    final newSecretKey = await pbkdf2.deriveKeyFromPassword(
      password: password,
      nonce: [1, 2, 3],
    );

    return newSecretKey;
  }

  static Future<String> encryptData(SecretKey secretKey, String data) async {
    final secretBox = await _algorithm.encryptString(
      data,
      secretKey: secretKey,
    );

    final cipherText = secretBox.concatenation();
    return base64Encode(cipherText);
  }

  static Future<String> decryptData(SecretKey secretKey, String data) async {
    final secretBox = SecretBox.fromConcatenation(
      base64Decode(data),
      nonceLength: _algorithm.nonceLength,
      macLength: _algorithm.macAlgorithm.macLength,
    );

    final decryptedData = await _algorithm.decryptString(
      secretBox,
      secretKey: secretKey,
    );

    return decryptedData;
  }
}
