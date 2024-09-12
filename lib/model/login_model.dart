class LoginModel {
  Response? response;

  LoginModel({
    this.response,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );
}

class Response {
  List<Datum>? data;

  Response({
    this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  FieldData? fieldData;

  Datum({
    this.fieldData,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fieldData: json["fieldData"] == null
            ? null
            : FieldData.fromJson(json["fieldData"]),
      );
}

class FieldData {
    String? loginId;
    String? userId;
    String? otp;
    String? message;
    String? userName;
    String? tdFlag;
    String? otpActive;
    String? userEmail;
    String? userPhone;
    String? teliosLoginVsTeliosSettingsStaticApkVersion;
    String? geoJsonFetchFlag;
    String? adminOrNot;
    String? usersVsUserroleVsroleRole;

    FieldData({
        this.loginId,
        this.userId,
        this.otp,
        this.message,
        this.userName,
        this.tdFlag,
        this.otpActive,
        this.userEmail,
        this.userPhone,
        this.teliosLoginVsTeliosSettingsStaticApkVersion,
        this.geoJsonFetchFlag,
        this.adminOrNot,
        this.usersVsUserroleVsroleRole,
    });

    factory FieldData.fromJson(Map<String, dynamic> json) => FieldData(
        loginId: json["login_id"],
        userId: json["user_id"],
        otp: json["otp"],
        message: json["Message"],
        userName: json["user_name"],
        tdFlag: json["td_flag"],
        otpActive: json["otp_active"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        teliosLoginVsTeliosSettingsStaticApkVersion: json["Telios_Login_VS_Telios_settings_||_static::apkVersion"],
        geoJsonFetchFlag: json["geoJsonFetchFlag"],
        adminOrNot: json["Admin_or_Not"],
        usersVsUserroleVsroleRole: json["usersVsUserroleVsrole::role"],
    );

}