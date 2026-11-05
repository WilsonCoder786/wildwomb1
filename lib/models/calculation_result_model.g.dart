// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculationResultModelAdapter extends TypeAdapter<CalculationResultModel> {
  @override
  final int typeId = 3;

  @override
  CalculationResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalculationResultModel(
      area: fields[0] as double,
      reserveArea: fields[1] as double,
      packs: fields[2] as int,
      paintLiters: fields[3] as int,
      laborHours: fields[4] as int,
      materialCost: fields[5] as double,
      laborCost: fields[6] as double,
      outsourcingCost: fields[7] as double,
      savings: fields[8] as double,
      savingsPercent: fields[9] as int,
      proHours: fields[10] as double,
      klusserHours: fields[11] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CalculationResultModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.area)
      ..writeByte(1)
      ..write(obj.reserveArea)
      ..writeByte(2)
      ..write(obj.packs)
      ..writeByte(3)
      ..write(obj.paintLiters)
      ..writeByte(4)
      ..write(obj.laborHours)
      ..writeByte(5)
      ..write(obj.materialCost)
      ..writeByte(6)
      ..write(obj.laborCost)
      ..writeByte(7)
      ..write(obj.outsourcingCost)
      ..writeByte(8)
      ..write(obj.savings)
      ..writeByte(9)
      ..write(obj.savingsPercent)
      ..writeByte(10)
      ..write(obj.proHours)
      ..writeByte(11)
      ..write(obj.klusserHours);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
