// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistermodelAdapter extends TypeAdapter<Registermodel> {
  @override
  final int typeId = 0;

  @override
  Registermodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Registermodel(
      id: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String,
      comformpass: fields[3] as String,
      higtht: fields[4] as String,
      weigth: fields[5] as String,
      age: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Registermodel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.comformpass)
      ..writeByte(4)
      ..write(obj.higtht)
      ..writeByte(5)
      ..write(obj.weigth)
      ..writeByte(6)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistermodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
