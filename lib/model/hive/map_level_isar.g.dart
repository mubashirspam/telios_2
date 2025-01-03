// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_level_isar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMapLevelModelAdapter extends TypeAdapter<HiveMapLevelModel> {
  @override
  final int typeId = 3;

  @override
  HiveMapLevelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMapLevelModel()
      ..assignedLevelKey = fields[0] as String?
      ..assignedLevelName = fields[1] as String?
      ..levels = (fields[2] as List?)?.cast<HiveMapLevel>();
  }

  @override
  void write(BinaryWriter writer, HiveMapLevelModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.assignedLevelKey)
      ..writeByte(1)
      ..write(obj.assignedLevelName)
      ..writeByte(2)
      ..write(obj.levels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMapLevelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveMapLevelAdapter extends TypeAdapter<HiveMapLevel> {
  @override
  final int typeId = 4;

  @override
  HiveMapLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMapLevel()
      ..levelName = fields[0] as String?
      ..levelKey = fields[1] as String?
      ..geoJson = fields[2] as String?
      ..surveyLevelCount = fields[3] as int?;
  }

  @override
  void write(BinaryWriter writer, HiveMapLevel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.levelName)
      ..writeByte(1)
      ..write(obj.levelKey)
      ..writeByte(2)
      ..write(obj.geoJson)
      ..writeByte(3)
      ..write(obj.surveyLevelCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMapLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
