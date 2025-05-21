// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayModelAdapter extends TypeAdapter<DayModel> {
  @override
  final int typeId = 0;

  @override
  DayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayModel(
      dayName: fields[3] as String,
      dayNum: fields[4] as String,
      date: fields[0] as String,
      percent: fields[2] as double?,
      habitsList: (fields[1] as List?)?.cast<HabitModel>(),
      counter: fields[5] as int?,
      completness: fields[6] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DayModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.habitsList)
      ..writeByte(2)
      ..write(obj.percent)
      ..writeByte(3)
      ..write(obj.dayName)
      ..writeByte(4)
      ..write(obj.dayNum)
      ..writeByte(5)
      ..write(obj.counter)
      ..writeByte(6)
      ..write(obj.completness);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
