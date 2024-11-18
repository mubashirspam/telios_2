// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_level_isar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSurveyLevelModelAdapter extends TypeAdapter<HiveSurveyLevelModel> {
  @override
  final int typeId = 8;

  @override
  HiveSurveyLevelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyLevelModel()
      ..geoJsonLevelKey = fields[0] as String?
      ..geoJsonLevelName = fields[1] as String?
      ..assignedLevelKey = fields[2] as String?
      ..assignedLevelName = fields[3] as String?
      ..levels = (fields[4] as List?)?.cast<HiveSurveyLevel>();
  }

  @override
  void write(BinaryWriter writer, HiveSurveyLevelModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.geoJsonLevelKey)
      ..writeByte(1)
      ..write(obj.geoJsonLevelName)
      ..writeByte(2)
      ..write(obj.assignedLevelKey)
      ..writeByte(3)
      ..write(obj.assignedLevelName)
      ..writeByte(4)
      ..write(obj.levels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyLevelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveSurveyLevelAdapter extends TypeAdapter<HiveSurveyLevel> {
  @override
  final int typeId = 9;

  @override
  HiveSurveyLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSurveyLevel()
      ..levelName = fields[0] as String?
      ..levelKey = fields[1] as String?
      ..geoJson = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, HiveSurveyLevel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.levelName)
      ..writeByte(1)
      ..write(obj.levelKey)
      ..writeByte(2)
      ..write(obj.geoJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSurveyLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
