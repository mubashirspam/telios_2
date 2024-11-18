import 'package:hive/hive.dart';

import '../../../model/model.dart';

import '../../../settings/helper/get_di.dart';

class UserDB {
  UserDB._();
  static final instance = UserDB._();

final box = Hive.box<HiveUser>(HiveBoxes.users);

  Future<void> postData(UserData? userData) async {
    if (userData == null) return;



    final newUser = HiveUser()
      ..name = userData.userName
      ..email = userData.userEmail
      ..userId = userData.userId
      ..profileImage = userData.userProfileAvatar
      ..country = userData.userCountry
      ..countryIso = userData.userCountryIso
      ..apkVersion = userData.teliosPersonVsTeliosSettingsstaticApkVersion
      ..phoneNumber = userData.userPhone;

    await box.put(userData.userId, newUser); // Use userId as the key
  }

  Future<UserData?> fetchUser(String userId) async {

    final hiveUser = box.get(userId); // Retrieve user by userId key

    if (hiveUser == null) return null;

    return UserData(
      userEmail: hiveUser.email,
      userId: hiveUser.userId,
      userName: hiveUser.name,
      userPhone: hiveUser.phoneNumber,
      userProfileAvatar: hiveUser.profileImage,
      userCountry: hiveUser.country,
      userCountryIso: hiveUser.countryIso,
      teliosPersonVsTeliosSettingsstaticApkVersion: hiveUser.apkVersion,
    );
  }

  Future<bool> deleteUser(String userId) async {
    try {
   

      if (box.containsKey(userId)) {
        await box.delete(userId); // Delete user by userId key
        return true;
      }

      return false;
    } catch (error) {
      print('Error deleting user: $error');
      return false;
    }
  }
}
