import 'package:hive/hive.dart';

part 'user_isar_model.g.dart';

@HiveType(typeId: 16) // Assign a unique typeId for this class.
class HiveUser {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? userId;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? country;

  @HiveField(4)
  String? phoneNumber;

  @HiveField(5)
  String? profileImage;

  @HiveField(6)
  String? countryIso;

  @HiveField(7)
  String? apkVersion;

  @HiveField(8)
  int? surveyLevelId;

  @HiveField(9)
  int? userAssignedLevelId;

  @HiveField(10)
  int? geoJsonLevelId;
}
