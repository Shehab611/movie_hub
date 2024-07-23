import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart';

final class EncryptionService {
  late AsymmetricKeyPair<PublicKey, PrivateKey> _keyPair;
  late Encrypter _encrypter;

  EncryptionService() {
    _keyPair = _generateRSAKeyPair();
    _encrypter = Encrypter(RSA(
        publicKey: _keyPair.publicKey as RSAPublicKey,
        privateKey: _keyPair.privateKey as RSAPrivateKey));
  }

  AsymmetricKeyPair<PublicKey, PrivateKey> _generateRSAKeyPair() {
    final keyGen = RSAKeyGenerator()
      ..init(ParametersWithRandom(
        RSAKeyGeneratorParameters(BigInt.from(65537), 2048, 64),
        FortunaRandom(),
      ));
    return keyGen.generateKeyPair();
  }

  String encrypt(String plainText) {
    final encrypted = _encrypter.encrypt(plainText);
    return encrypted.base64;
  }

  String decrypt(String encryptedText) {
    final encrypted = Encrypted.fromBase64(encryptedText);
    return _encrypter.decrypt(encrypted);
  }
}
