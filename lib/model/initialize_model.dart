// To parse this JSON data, do
//
//     final initializeModel = initializeModelFromJson(jsonString);

import 'dart:convert';

InitializeModel initializeModelFromJson(String str) =>
    InitializeModel.fromJson(json.decode(str));

String initializeModelToJson(InitializeModel data) =>
    json.encode(data.toJson());

class InitializeModel {
  Res? response;

  InitializeModel({
    this.response,
  });

  factory InitializeModel.fromJson(Map<String, dynamic> json) =>
      InitializeModel(
        response: json["response"] == null
            ? null
            : Res.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
      };
}

class Res {
  String? token;

  Res({
    this.token,
  });

  factory Res.fromJson(Map<String, dynamic> json) => Res(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
