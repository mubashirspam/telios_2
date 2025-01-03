import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

IOSOptions _getIOSOptions() => const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
      synchronizable: true,
    );

final storage = FlutterSecureStorage(
  aOptions: _getAndroidOptions(),
  iOptions: _getIOSOptions(),
);

// add
Future<void> setString(String key, String value) async {
  await storage.write(key: key, value: value);
}

Future<void> setBool(String key, bool value) async {
  await storage.write(key: key, value: value.toString());
}

// get
Future<String?> getString(String key) async {
  final value = await storage.read(key: key);
  return value;
}

Future<bool> getBool(String key) async {
  final value = await storage.read(key: key);
  return value == 'true';
}

// delete
Future<void> remove(String key) async {
  await storage.delete(key: key);
}

Future<void> removeAll() async {
  await storage.deleteAll();
}
