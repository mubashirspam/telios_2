// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_question_isar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSurveyQuestionModelAdapter
    extends TypeAdapter<HiveSurveyQuestionModel> {
  @override
  final int typeId = 10;

  @override
  HiveSurveyQuestionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyQuestionModel()
      ..assignedLevelKey = fields[0] as String?
      ..surveyId = fields[1] as int?
      ..surveyName = fields[2] as String?
      ..questions = (fields[3] as List?)?.cast<HiveSurveyQuestion>()
      ..category = (fields[4] as List?)?.cast<HiveSurveyCategory>();
  }

  @override
  void write(BinaryWriter writer, HiveSurveyQuestionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.assignedLevelKey)
      ..writeByte(1)
      ..write(obj.surveyId)
      ..writeByte(2)
      ..write(obj.surveyName)
      ..writeByte(3)
      ..write(obj.questions)
      ..writeByte(4)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyQuestionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveSurveyQuestionAdapter extends TypeAdapter<HiveSurveyQuestion> {
  @override
  final int typeId = 11;

  @override
  HiveSurveyQuestion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyQuestion()
      ..questionId = fields[0] as int?
      ..question = fields[1] as String?
      ..type = fields[2] as String?
      ..typeId = fields[3] as int?
      ..colorcode = fields[4] as int?
      ..isQuestionVisible = fields[5] as bool?
      ..hint = fields[6] as String?
      ..isCounter = fields[7] as bool?
      ..parentQuestionId = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, HiveSurveyQuestion obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.typeId)
      ..writeByte(4)
      ..write(obj.colorcode)
      ..writeByte(5)
      ..write(obj.isQuestionVisible)
      ..writeByte(6)
      ..write(obj.hint)
      ..writeByte(7)
      ..write(obj.isCounter)
      ..writeByte(8)
      ..write(obj.parentQuestionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyQuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveSurveyCategoryAdapter extends TypeAdapter<HiveSurveyCategory> {
  @override
  final int typeId = 12;

  @override
  HiveSurveyCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyCategory()
      ..questionId = fields[0] as int?
      ..surveyId = fields[1] as int?
      ..categoryName = fields[2] as String?
      ..colorcode = fields[3] as int?;
  }

  @override
  void write(BinaryWriter writer, HiveSurveyCategory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.surveyId)
      ..writeByte(2)
      ..write(obj.categoryName)
      ..writeByte(3)
      ..write(obj.colorcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
