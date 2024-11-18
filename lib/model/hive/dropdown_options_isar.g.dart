// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_options_isar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMultiDropdownOptionModelAdapter
    extends TypeAdapter<HiveMultiDropdownOptionModel> {
  @override
  final int typeId = 1;

  @override
  HiveMultiDropdownOptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMultiDropdownOptionModel()
      ..levelKey = fields[0] as String?
      ..surveyId = fields[1] as int?
      ..options = (fields[2] as List?)?.cast<HiveChildOption>()
      ..nestedOptions = (fields[3] as List?)?.cast<HiveChildOption>();
  }

  @override
  void write(BinaryWriter writer, HiveMultiDropdownOptionModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.levelKey)
      ..writeByte(1)
      ..write(obj.surveyId)
      ..writeByte(2)
      ..write(obj.options)
      ..writeByte(3)
      ..write(obj.nestedOptions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMultiDropdownOptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveChildOptionAdapter extends TypeAdapter<HiveChildOption> {
  @override
  final int typeId = 2;

  @override
  HiveChildOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveChildOption()
      ..optionId = fields[0] as int?
      ..parentQuestionId = fields[1] as int?
      ..questionId = fields[2] as int?
      ..optionValue = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, HiveChildOption obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.optionId)
      ..writeByte(1)
      ..write(obj.parentQuestionId)
      ..writeByte(2)
      ..write(obj.questionId)
      ..writeByte(3)
      ..write(obj.optionValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveChildOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
