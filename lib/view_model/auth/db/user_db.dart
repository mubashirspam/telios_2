import 'package:isar/isar.dart';
import 'package:telios_2/model/user_model.dart';
import '../../../model/isar/isar.dart';
import '../../../settings/helper/constants.dart';

class UserDB {
  UserDB._();
  static final instance = UserDB._();

  Future<void> postData(UserData? userData) async {
    if (userData == null) {
      return;
    }

    var isar = Isar.getInstance(db);
    final collection = isar?.collection<IsarUser>();
    await isar?.writeTxn(() async {
    
      final newUser = IsarUser()
        ..name = userData.userName
        ..email = userData.userEmail
        ..userId = userData.userId
        ..profileImage = userData.userProfileAvatar
        ..country = userData.userCountry
        ..countryIso = userData.userCountryIso
        ..apkVersion = userData.teliosPersonVsTeliosSettingsstaticApkVersion
        ..phoneNumber = userData.userPhone;

      await collection?.put(newUser);
    });
  }

  Future<UserData?> fetchUser(userId) async {
    var isar = Isar.getInstance(db);
    final collection = isar!.collection<IsarUser>();
    final data = await collection.filter().userIdContains(userId!).findAll();
    UserData? userData;

    if (data.isNotEmpty) {
      final datas = data.first;
      userData = UserData(
        userEmail: datas.email,
        userId: datas.userId,
        userName: datas.name,
        userPhone: datas.phoneNumber,
        userProfileAvatar: datas.profileImage,
        userCountry: datas.country,
        userCountryIso: datas.countryIso,
        teliosPersonVsTeliosSettingsstaticApkVersion: datas.apkVersion,
      );
    }

    return userData;
  }

  Future<bool> deleteUser(String userId) async {
    try {
      var isar = Isar.getInstance(db);
      final collection = isar!.collection<IsarUser>();

      final data = await collection.where().findAll();

      if (data.isNotEmpty) {
        List<IsarUser> isarData = data;

        for (IsarUser dta in isarData) {
          if (dta.userId == userId) {
            await isar.writeTxn(() async {
              await collection.delete(dta.id);
            });
          }
        }
        return true;
      } else {
        return false;
      }

      // Notify the user of successful deletion
    } catch (error) {
      print('Error deleting data: $error');
      return false;

      // Handle any errors
    }
  }
}
