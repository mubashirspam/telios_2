// To parse this JSON data, do
//
//     final remoteQuestionModel = remoteQuestionModelFromJson(jsonString);

import 'dart:convert';

RemoteQuestionModel remoteQuestionModelFromJson(String str) =>
    RemoteQuestionModel.fromJson(json.decode(str));

String remoteQuestionModelToJson(RemoteQuestionModel data) =>
    json.encode(data.toJson());

class RemoteQuestionModel {
  Response? response;
  List<Message>? messages;

  RemoteQuestionModel({
    this.response,
    this.messages,
  });

  factory RemoteQuestionModel.fromJson(Map<String, dynamic> json) =>
      RemoteQuestionModel(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        messages: json["messages"] == null
            ? []
            : List<Message>.from(
                json["messages"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "messages": messages == null
            ? []
            : List<dynamic>.from(messages!.map((x) => x.toJson())),
      };
}

class Message {
  String? code;
  String? message;

  Message({
    this.code,
    this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class Response {
  DataInfo? dataInfo;
  List<Datum>? data;

  Response({
    this.dataInfo,
    this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        dataInfo: json["dataInfo"] == null
            ? null
            : DataInfo.fromJson(json["dataInfo"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dataInfo": dataInfo?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  FieldData? fieldData;
  PortalData? portalData;
  String? recordId;
  String? modId;
  List<PortalDataInfo>? portalDataInfo;

  Datum({
    this.fieldData,
    this.portalData,
    this.recordId,
    this.modId,
    this.portalDataInfo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fieldData: json["fieldData"] == null
            ? null
            : FieldData.fromJson(json["fieldData"]),
        portalData: json["portalData"] == null
            ? null
            : PortalData.fromJson(json["portalData"]),
        recordId: json["recordId"],
        modId: json["modId"],
        portalDataInfo: json["portalDataInfo"] == null
            ? []
            : List<PortalDataInfo>.from(
                json["portalDataInfo"]!.map((x) => PortalDataInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fieldData": fieldData?.toJson(),
        "portalData": portalData?.toJson(),
        "recordId": recordId,
        "modId": modId,
        "portalDataInfo": portalDataInfo == null
            ? []
            : List<dynamic>.from(portalDataInfo!.map((x) => x.toJson())),
      };
}

class FieldData {
  int? id;
  String? survey;

  FieldData({
    this.id,
    this.survey,
  });

  factory FieldData.fromJson(Map<String, dynamic> json) => FieldData(
        id: json["id"],
        survey: json["survey"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "survey": survey,
      };
}

class PortalData {
  List<SurveyQuestion>? surveyQuestion;

  PortalData({
    this.surveyQuestion,
  });

  factory PortalData.fromJson(Map<String, dynamic> json) => PortalData(
        surveyQuestion: json["surveyQuestion"] == null
            ? []
            : List<SurveyQuestion>.from(
                json["surveyQuestion"]!.map((x) => SurveyQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "surveyQuestion": surveyQuestion == null
            ? []
            : List<dynamic>.from(surveyQuestion!.map((x) => x.toJson())),
      };
}

class SurveyQuestion {
  String? recordId;
  int? surveyQuestionId;
  String? surveyQuestionQuestion;
  int? surveyQuestionQuestionTypeId;
  String? surveyQuestionColor;
  String? surveyVsquestionvsquestionTypeQuestionType;
  String? surveyQuestionIsCounter;
  String? surveyQuestionHint;
  String? modId;

  SurveyQuestion({
    this.recordId,
    this.surveyQuestionId,
    this.surveyQuestionQuestion,
    this.surveyQuestionQuestionTypeId,
    this.surveyQuestionColor,
    this.surveyVsquestionvsquestionTypeQuestionType,
    this.surveyQuestionIsCounter,
    this.surveyQuestionHint,
    this.modId,
  });

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) => SurveyQuestion(
        recordId: json["recordId"],
        surveyQuestionId: json["surveyQuestion::id"],
        surveyQuestionQuestion: json["surveyQuestion::question"],
        surveyQuestionQuestionTypeId: json["surveyQuestion::questionTypeId"],
        surveyQuestionColor: json["surveyQuestion::color"],
        surveyVsquestionvsquestionTypeQuestionType:
            json["surveyVsquestionvsquestionType::questionType"],
        surveyQuestionIsCounter: json["surveyQuestion::isCounter"],
        surveyQuestionHint: json["surveyQuestion::hint"],
        modId: json["modId"],
      );

  Map<String, dynamic> toJson() => {
        "recordId": recordId,
        "surveyQuestion::id": surveyQuestionId,
        "surveyQuestion::question": surveyQuestionQuestion,
        "surveyQuestion::questionTypeId": surveyQuestionQuestionTypeId,
        "surveyQuestion::color": surveyQuestionColor,
        "surveyVsquestionvsquestionType::questionType":
            surveyVsquestionvsquestionTypeQuestionType,
        "surveyQuestion::isCounter": surveyQuestionIsCounter,
        "surveyQuestion::hint": surveyQuestionHint,
        "modId": modId,
      };
}

class PortalDataInfo {
  String? database;
  String? table;
  int? foundCount;
  int? returnedCount;

  PortalDataInfo({
    this.database,
    this.table,
    this.foundCount,
    this.returnedCount,
  });

  factory PortalDataInfo.fromJson(Map<String, dynamic> json) => PortalDataInfo(
        database: json["database"],
        table: json["table"],
        foundCount: json["foundCount"],
        returnedCount: json["returnedCount"],
      );

  Map<String, dynamic> toJson() => {
        "database": database,
        "table": table,
        "foundCount": foundCount,
        "returnedCount": returnedCount,
      };
}

class DataInfo {
  String? database;
  String? layout;
  String? table;
  int? totalRecordCount;
  int? foundCount;
  int? returnedCount;

  DataInfo({
    this.database,
    this.layout,
    this.table,
    this.totalRecordCount,
    this.foundCount,
    this.returnedCount,
  });

  factory DataInfo.fromJson(Map<String, dynamic> json) => DataInfo(
        database: json["database"],
        layout: json["layout"],
        table: json["table"],
        totalRecordCount: json["totalRecordCount"],
        foundCount: json["foundCount"],
        returnedCount: json["returnedCount"],
      );

  Map<String, dynamic> toJson() => {
        "database": database,
        "layout": layout,
        "table": table,
        "totalRecordCount": totalRecordCount,
        "foundCount": foundCount,
        "returnedCount": returnedCount,
      };
}

final teliosQuestionData = {
  "response": {
    "dataInfo": {
      "database": "DataV1",
      "layout": "surveyQuestions",
      "table": "survey",
      "totalRecordCount": 5,
      "foundCount": 5,
      "returnedCount": 5
    },
    "data": [
      {
        "fieldData": {"id": 1, "survey": "Telios"},
        "portalData": {
          "surveyQuestion": [
            {
              "recordId": "1",
              "surveyQuestion::id": 20,
              "surveyQuestion::question": "PC",
              "surveyQuestion::questionTypeId": 5,
              "surveyQuestion::color": "0xFF62BEEB",
              "surveyVsquestionvsquestionType::questionType": "Int",
              "surveyQuestion::isCounter": "1",
              "surveyQuestion::hint": "Enter your value",
              "modId": "6"
            },
            {
              "recordId": "2",
              "surveyQuestion::id": 21,
              "surveyQuestion::question": "HC",
              "surveyQuestion::questionTypeId": 5,
              "surveyQuestion::color": "0xFF9ACB41",
              "surveyVsquestionvsquestionType::questionType": "Int",
              "surveyQuestion::isCounter": "1",
              "surveyQuestion::hint": "Enter your value",
              "modId": "5"
            },
            {
              "recordId": "3",
              "surveyQuestion::id": 22,
              "surveyQuestion::question": "MC",
              "surveyQuestion::questionTypeId": 5,
              "surveyQuestion::color": "0xFF4169E1",
              "surveyVsquestionvsquestionType::questionType": "Int",
              "surveyQuestion::isCounter": "1",
              "surveyQuestion::hint": "Enter your value",
              "modId": "5"
            },
            {
              "recordId": "4",
              "surveyQuestion::id": 23,
              "surveyQuestion::question": "AV",
              "surveyQuestion::questionTypeId": 4,
              "surveyQuestion::color": "",
              "surveyVsquestionvsquestionType::questionType": "Boolean",
              "surveyQuestion::isCounter": "",
              "surveyQuestion::hint": "",
              "modId": "4"
            },
            {
              "recordId": "8",
              "surveyQuestion::id": 27,
              "surveyQuestion::question": "Contact Name",
              "surveyQuestion::questionTypeId": 1,
              "surveyQuestion::color": "",
              "surveyVsquestionvsquestionType::questionType": "Short answer",
              "surveyQuestion::isCounter": "",
              "surveyQuestion::hint": "Enter name",
              "modId": "3"
            },
            {
              "recordId": "9",
              "surveyQuestion::id": 28,
              "surveyQuestion::question": "Contact Number",
              "surveyQuestion::questionTypeId": 5,
              "surveyQuestion::color": "",
              "surveyVsquestionvsquestionType::questionType": "Int",
              "surveyQuestion::isCounter": "",
              "surveyQuestion::hint": "Enter contact number",
              "modId": "3"
            },
            {
              "recordId": "10",
              "surveyQuestion::id": 29,
              "surveyQuestion::question": "Notes",
              "surveyQuestion::questionTypeId": 6,
              "surveyQuestion::color": "",
              "surveyVsquestionvsquestionType::questionType": "Long answer",
              "surveyQuestion::isCounter": "",
              "surveyQuestion::hint": "enter notes",
              "modId": "3"
            }
          ]
        },
        "recordId": "1",
        "modId": "2",
        "portalDataInfo": [
          {
            "database": "DataV1",
            "table": "surveyQuestion",
            "foundCount": 7,
            "returnedCount": 7
          }
        ]
      },
      {
        "fieldData": {"id": 2, "survey": "people group"},
        "portalData": {
          "surveyQuestion": [
            {
              "recordId": "5",
              "surveyQuestion::id": 24,
              "surveyQuestion::question": "People Group",
              "surveyQuestion::questionTypeId": 2,
              "surveyQuestion::color": "",
              "surveyVsquestionvsquestionType::questionType": "Multi select",
              "surveyQuestion::isCounter": "",
              "surveyQuestion::hint": "Select people group",
              "modId": "4"
            }
          ]
        },
        "recordId": "2",
        "modId": "1",
        "portalDataInfo": [
          {
            "database": "DataV1",
            "table": "surveyQuestion",
            "foundCount": 1,
            "returnedCount": 1
          }
        ]
      },
      {
        "fieldData": {"id": 3, "survey": "AV"},
        "portalData": {"surveyQuestion": []},
        "recordId": "3",
        "modId": "0",
        "portalDataInfo": [
          {
            "database": "DataV1",
            "table": "surveyQuestion",
            "foundCount": 0,
            "returnedCount": 0
          }
        ]
      },
      {
        "fieldData": {"id": 4, "survey": "Language Group"},
        "portalData": {
          "surveyQuestion": [
            {
              "recordId": "6",
              "surveyQuestion::id": 25,
              "surveyQuestion::question": "Language ISO",
              "surveyQuestion::questionTypeId": 2,
              "surveyQuestion::color": "",
              "surveyVsquestionvsquestionType::questionType": "Multi select",
              "surveyQuestion::isCounter": "",
              "surveyQuestion::hint": "Select language",
              "modId": "3"
            }
          ]
        },
        "recordId": "4",
        "modId": "0",
        "portalDataInfo": [
          {
            "database": "DataV1",
            "table": "surveyQuestion",
            "foundCount": 1,
            "returnedCount": 1
          }
        ]
      },
      {
        "fieldData": {"id": 5, "survey": "Social Issues"},
        "portalData": {
          "surveyQuestion": [
            {
              "recordId": "7",
              "surveyQuestion::id": 26,
              "surveyQuestion::question": "Social Issues",
              "surveyQuestion::questionTypeId": 2,
              "surveyQuestion::color": "",
              "surveyVsquestionvsquestionType::questionType": "Multi select",
              "surveyQuestion::isCounter": "",
              "surveyQuestion::hint": "Select social issues",
              "modId": "4"
            }
          ]
        },
        "recordId": "5",
        "modId": "0",
        "portalDataInfo": [
          {
            "database": "DataV1",
            "table": "surveyQuestion",
            "foundCount": 1,
            "returnedCount": 1
          }
        ]
      }
    ]
  },
  "messages": [
    {"code": "0", "message": "OK"}
  ]
};
