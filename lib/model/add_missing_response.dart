// To parse this JSON data, do
//
//     final addMissingLevel = addMissingLevelFromJson(jsonString);

import 'dart:convert';

AddMissingLevel addMissingLevelFromJson(String str) => AddMissingLevel.fromJson(json.decode(str));

String addMissingLevelToJson(AddMissingLevel data) => json.encode(data.toJson());

class AddMissingLevel {
    Response? response;
    List<Message>? messages;

    AddMissingLevel({
        this.response,
        this.messages,
    });

    factory AddMissingLevel.fromJson(Map<String, dynamic> json) => AddMissingLevel(
        response: json["response"] == null ? null : Response.fromJson(json["response"]),
        messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
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
    String? scriptError;
    String? recordId;
    String? modId;

    Response({
        this.scriptError,
        this.recordId,
        this.modId,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        scriptError: json["scriptError"],
        recordId: json["recordId"],
        modId: json["modId"],
    );

    Map<String, dynamic> toJson() => {
        "scriptError": scriptError,
        "recordId": recordId,
        "modId": modId,
    };
}
