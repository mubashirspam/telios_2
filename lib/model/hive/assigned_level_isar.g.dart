// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_level_isar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAssignedLevelAdapter extends TypeAdapter<HiveAssignedLevel> {
  @override
  final int typeId = 0;

  @override
  HiveAssignedLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAssignedLevel()
      ..userId = fields[0] as String?
      ..unitId = fields[1] as String?
      ..levelName = fields[2] as String?
      ..levelKey = fields[3] as String?
      ..assignedLevel = fields[4] as String?
      ..surveyLevel = fields[5] as String?
      ..surveyLevelCount = fields[6] as int?
      ..geoJsonLevel = fields[7] as String?
      ..geoJsonLevelCount = fields[8] as int?
      ..geoJson = fields[9] as String?
      ..assignedLevelId = fields[10] as int?;
  }

  @override
  void write(BinaryWriter writer, HiveAssignedLevel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.unitId)
      ..writeByte(2)
      ..write(obj.levelName)
      ..writeByte(3)
      ..write(obj.levelKey)
      ..writeByte(4)
      ..write(obj.assignedLevel)
      ..writeByte(5)
      ..write(obj.surveyLevel)
      ..writeByte(6)
      ..write(obj.surveyLevelCount)
      ..writeByte(7)
      ..write(obj.geoJsonLevel)
      ..writeByte(8)
      ..write(obj.geoJsonLevelCount)
      ..writeByte(9)
      ..write(obj.geoJson)
      ..writeByte(10)
      ..write(obj.assignedLevelId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAssignedLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
