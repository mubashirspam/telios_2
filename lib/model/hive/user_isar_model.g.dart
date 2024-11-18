// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_isar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserAdapter extends TypeAdapter<HiveUser> {
  @override
  final int typeId = 16;

  @override
  HiveUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUser()
      ..name = fields[0] as String?
      ..userId = fields[1] as String?
      ..email = fields[2] as String?
      ..country = fields[3] as String?
      ..phoneNumber = fields[4] as String?
      ..profileImage = fields[5] as String?
      ..countryIso = fields[6] as String?
      ..apkVersion = fields[7] as String?
      ..surveyLevelId = fields[8] as int?
      ..userAssignedLevelId = fields[9] as int?
      ..geoJsonLevelId = fields[10] as int?;
  }

  @override
  void write(BinaryWriter writer, HiveUser obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.profileImage)
      ..writeByte(6)
      ..write(obj.countryIso)
      ..writeByte(7)
      ..write(obj.apkVersion)
      ..writeByte(8)
      ..write(obj.surveyLevelId)
      ..writeByte(9)
      ..write(obj.userAssignedLevelId)
      ..writeByte(10)
      ..write(obj.geoJsonLevelId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
