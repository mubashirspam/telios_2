// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_answer_isar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSurveyAnswerModelAdapter extends TypeAdapter<HiveSurveyAnswerModel> {
  @override
  final int typeId = 5;

  @override
  HiveSurveyAnswerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyAnswerModel()
      ..geoJsonLevelKey = fields[0] as String?
      ..geoJsonLevelName = fields[1] as String?
      ..surveyLevelName = fields[2] as String?
      ..surveyLevelKey = fields[3] as String?
      ..assignedLevelKey = fields[4] as String?
      ..assignedLevelName = fields[5] as String?
      ..answers = (fields[6] as List?)?.cast<HiveAnswer>()
      ..aCategory = fields[7] as int?
      ..sCategory = fields[8] as int?
      ..gCategory = fields[9] as int?;
  }

  @override
  void write(BinaryWriter writer, HiveSurveyAnswerModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.geoJsonLevelKey)
      ..writeByte(1)
      ..write(obj.geoJsonLevelName)
      ..writeByte(2)
      ..write(obj.surveyLevelName)
      ..writeByte(3)
      ..write(obj.surveyLevelKey)
      ..writeByte(4)
      ..write(obj.assignedLevelKey)
      ..writeByte(5)
      ..write(obj.assignedLevelName)
      ..writeByte(6)
      ..write(obj.answers)
      ..writeByte(7)
      ..write(obj.aCategory)
      ..writeByte(8)
      ..write(obj.sCategory)
      ..writeByte(9)
      ..write(obj.gCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyAnswerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveAnswerAdapter extends TypeAdapter<HiveAnswer> {
  @override
  final int typeId = 6;

  @override
  HiveAnswer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAnswer()
      ..id = fields[0] as String?
      ..answer = fields[1] as String?
      ..type = fields[2] as String?
      ..category = fields[3] as int?
      ..surveyId = fields[4] as int?
      ..questionId = fields[5] as int?
      ..question = fields[6] as String?
      ..typeId = fields[7] as int?
      ..answerOptions = (fields[8] as List?)?.cast<HiveDItem>();
  }

  @override
  void write(BinaryWriter writer, HiveAnswer obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.answer)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.surveyId)
      ..writeByte(5)
      ..write(obj.questionId)
      ..writeByte(6)
      ..write(obj.question)
      ..writeByte(7)
      ..write(obj.typeId)
      ..writeByte(8)
      ..write(obj.answerOptions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveDItemAdapter extends TypeAdapter<HiveDItem> {
  @override
  final int typeId = 7;

  @override
  HiveDItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDItem()
      ..id = fields[0] as int?
      ..name = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, HiveDItem obj) {
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
      other is HiveDItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
