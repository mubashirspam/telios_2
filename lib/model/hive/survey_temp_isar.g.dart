// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_temp_isar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSurveyTempAdapter extends TypeAdapter<HiveSurveyTemp> {
  @override
  final int typeId = 13;

  @override
  HiveSurveyTemp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyTemp()
      ..surveyLevelName = fields[0] as String?
      ..surveyLevelKey = fields[1] as String?
      ..assignedLevelKey = fields[2] as String?
      ..assignedLevelName = fields[3] as String?
      ..geoJsonLevelKey = fields[4] as String?
      ..geoJsonLevelName = fields[5] as String?
      ..answers = (fields[6] as List?)?.cast<HiveSurveyTempAnswers>();
  }

  @override
  void write(BinaryWriter writer, HiveSurveyTemp obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.surveyLevelName)
      ..writeByte(1)
      ..write(obj.surveyLevelKey)
      ..writeByte(2)
      ..write(obj.assignedLevelKey)
      ..writeByte(3)
      ..write(obj.assignedLevelName)
      ..writeByte(4)
      ..write(obj.geoJsonLevelKey)
      ..writeByte(5)
      ..write(obj.geoJsonLevelName)
      ..writeByte(6)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyTempAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveSurveyTempAnswersAdapter extends TypeAdapter<HiveSurveyTempAnswers> {
  @override
  final int typeId = 14;

  @override
  HiveSurveyTempAnswers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyTempAnswers()
      ..surveyId = fields[0] as int?
      ..questionId = fields[1] as int?
      ..question = fields[2] as String?
      ..typeId = fields[3] as int?
      ..answer = fields[4] as String?
      ..answerOptions = (fields[5] as List?)?.cast<HiveDItemTemp>();
  }

  @override
  void write(BinaryWriter writer, HiveSurveyTempAnswers obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.surveyId)
      ..writeByte(1)
      ..write(obj.questionId)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.typeId)
      ..writeByte(4)
      ..write(obj.answer)
      ..writeByte(5)
      ..write(obj.answerOptions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyTempAnswersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveDItemTempAdapter extends TypeAdapter<HiveDItemTemp> {
  @override
  final int typeId = 15;

  @override
  HiveDItemTemp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDItemTemp()
      ..id = fields[0] as int?
      ..name = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, HiveDItemTemp obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDItemTempAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
