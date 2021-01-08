// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_plan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensePlanAdapter extends TypeAdapter<ExpensePlan> {
  @override
  final int typeId = 1;

  @override
  ExpensePlan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpensePlan(
      name: fields[0] as String,
      description: fields[1] as String,
      createdAt: fields[2] as DateTime,
      expenses: (fields[3] as List)?.cast<Expense>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExpensePlan obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.expenses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensePlanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
