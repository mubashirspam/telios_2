// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// //!==================DATABASE=============================
// //!=======================================================

// AndroidOptions _getAndroidOptions() => const AndroidOptions(
//       encryptedSharedPreferences: true,
//     );
// final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
// // add
// Future<void> addToSS(String key, String value) async {
//   await storage.write(key: key, value: value);
// }

// // get
// Future<String?> getFromSS(String key) async {
//   final value = await storage.read(key: key);
//   return value;
// }

// // delete
// Future<void> deleteFromSS(String key) async {
//   await storage.delete(key: key);
// }

// Future<void> deleteAllFromSS() async {
//   await storage.deleteAll();
// }

// //! token
// void addTokenToSS(String key, String value) {
//   storage.write(key: key, value: value);
// }

// Future<String?> getTokenFromSS(String key) async {
//   return await storage.read(key: key);
// }

// Future<String> getNameFromSS(String key) async {
//   final name = await storage.read(key: key);
//   return name ?? '';
// }
