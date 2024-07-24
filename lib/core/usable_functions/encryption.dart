import 'package:encrypt_decrypt_plus/cipher/cipher.dart';

final class EncryptionService {
  final Cipher _cipher;

  const EncryptionService(this._cipher);

  String encrypt(String text) {
    return _cipher.xorEncode(text,
        secretKey: const String.fromEnvironment('KEY'));
  }

  String decrypt(String text) {
    return _cipher.xorDecode(text,
        secretKey: const String.fromEnvironment('KEY'));
  }
}
