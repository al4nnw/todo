// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividade.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AtividadeAdapter extends TypeAdapter<Atividade> {
  @override
  final int typeId = 1;

  @override
  Atividade read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Atividade(
      horarioInicio: fields[0] as Horario,
      conteudo: fields[2] as String,
      duracaoEmMinutos: fields[5] as int,
      prioridade: fields[3] as int,
      completo: fields[4] as bool,
    )..horarioTermino = fields[1] as Horario?;
  }

  @override
  void write(BinaryWriter writer, Atividade obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.horarioInicio)
      ..writeByte(1)
      ..write(obj.horarioTermino)
      ..writeByte(2)
      ..write(obj.conteudo)
      ..writeByte(3)
      ..write(obj.prioridade)
      ..writeByte(4)
      ..write(obj.completo)
      ..writeByte(5)
      ..write(obj.duracaoEmMinutos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AtividadeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
