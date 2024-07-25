import 'dart:convert';

import 'package:encrypt/encrypt.dart';

final class EncryptionService {
  final Encrypter _encrypter;
  final IV _iv;

  const EncryptionService(this._encrypter, this._iv);

  String encrypt(String text) {
    return _encrypter.encrypt(text, iv: _iv).base64;
  }

  String decrypt(String text) {
    return _encrypter.decrypt64(text, iv: _iv);
  }

  bool _isBase64(String text) {
    try {
      base64.decode(text);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isEncrypted(String text) => _isBase64(text);
}