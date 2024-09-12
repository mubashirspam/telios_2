class UserModel {
  UserResponse? response;

  UserModel({
    this.response,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        response: json["response"] == null
            ? null
            : UserResponse.fromJson(json["response"]),
      );
}

class UserResponse {
  List<User>? user;

  UserResponse({
    this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        user: json["data"] == null
            ? []
            : List<User>.from(json["data"]!.map((x) => User.fromJson(x))),
      );
}

class User {
  UserData? userData;
  UserPortalData? portalData;

  User({
    this.userData,
    this.portalData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userData: json["fieldData"] == null
            ? null
            : UserData.fromJson(json["fieldData"]),
      );
}

class UserPortalData {
  List<PersonVsTeliosAssignmentuserid>? personVsTeliosAssignmentuserid;

  UserPortalData({
    this.personVsTeliosAssignmentuserid,
  });

  factory UserPortalData.fromJson(Map<String, dynamic> json) => UserPortalData(
        personVsTeliosAssignmentuserid:
            json["personVsTelios_Assignmentuserid"] == null
                ? []
                : List<PersonVsTeliosAssignmentuserid>.from(
                    json["personVsTelios_Assignmentuserid"]!.map(
                        (x) => PersonVsTeliosAssignmentuserid.fromJson(x))),
      );
}

class PersonVsTeliosAssignmentuserid {
  int? personVsTeliosAssignmentuseridSurveyLevelId;
  int? personVsTeliosAssignmentuseridUserAssingLevelId;
  int? personVsTeliosAssignmentuseridGeoJsonLevelId;

  PersonVsTeliosAssignmentuserid({
    this.personVsTeliosAssignmentuseridSurveyLevelId,
    this.personVsTeliosAssignmentuseridUserAssingLevelId,
    this.personVsTeliosAssignmentuseridGeoJsonLevelId,
  });

  factory PersonVsTeliosAssignmentuserid.fromJson(Map<String, dynamic> json) =>
      PersonVsTeliosAssignmentuserid(
        personVsTeliosAssignmentuseridSurveyLevelId:
            json["personVsTelios_Assignmentuserid::surveyLevelId"],
        personVsTeliosAssignmentuseridUserAssingLevelId:
            json["personVsTelios_Assignmentuserid::userAssingLevelId"],
        personVsTeliosAssignmentuseridGeoJsonLevelId:
            json["personVsTelios_Assignmentuserid::geoJsonLevelId"],
      );
}

class UserData {
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userProfileAvatar;
  String? userCountry;
  String? userCountryIso;
  String? teliosPersonVsTeliosSettingsstaticApkVersion;
  String? userId;
  String? teliosPersonVsTeliosUserPkGeoJsonFetchFlag;
  String? teliosPersonVsTeliosUserPkAdminOrNot;

  UserData({
    this.userName,
    this.userEmail,
    this.userPhone,
    this.userProfileAvatar,
    this.userCountry,
    this.userCountryIso,
    this.teliosPersonVsTeliosSettingsstaticApkVersion,
    this.userId,
    this.teliosPersonVsTeliosUserPkGeoJsonFetchFlag,
    this.teliosPersonVsTeliosUserPkAdminOrNot,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        userProfileAvatar: json["user_profile_avatar"],
        userCountry: json["userCountry"],
        userCountryIso: json["userCountryIso"],
        teliosPersonVsTeliosSettingsstaticApkVersion:
            json["Telios_personVsTelios_settingsstatic::apkVersion"],
        userId: json["user_id"],
        teliosPersonVsTeliosUserPkGeoJsonFetchFlag:
            json["Telios_person_vs_Telios_user_||_pk::geoJsonFetchFlag"],
        teliosPersonVsTeliosUserPkAdminOrNot:
            json["Telios_person_vs_Telios_user_||_pk::Admin_or_Not"],
      );
}
