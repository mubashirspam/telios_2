import 'package:isar/isar.dart';

part 'user_isar_model.g.dart';

@collection
class IsarUser {
  Id id = Isar.minId;
  @Index(type: IndexType.value)
  String? name;
  String? userId;
  String? email;
  String? country;
  String? phoneNumber;
  String? profileImage;
  String? countryIso;
  String? apkVersion;
  int? surveyLevelId;
  int? userAssingLevelId;
  int? geoJsonLevelId;
}
