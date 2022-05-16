import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Horario extends TimeOfDay {
  const Horario({required int hour, required int minute}) : super(hour: hour, minute: minute);

  const Horario.fromMinutes(int minutes)
      : super(hour: minutes ~/ 60, minute: minutes - ((minutes ~/ 60) * 60));

  int get asMinutes => hour * 60 + minute;

  ///Já que o tipo DateTime é nativamente suportado pelo Hive, é necessário fazer esta conversão
  DateTime toDate() => DateTime(0, 0, 0, hour, minute);

  @override
  String toString() {
    String buffer = "";

    if (hour < 10) {
      buffer += "0";
    }
    buffer += hour.toString();
    buffer += ":";
    if (minute < 10) {
      buffer += "0";
    }
    buffer += minute.toString();
    return buffer;
  }
}

class HorarioAdapter extends TypeAdapter<Horario> {
  @override
  int get typeId => 2;
  @override
  Horario read(BinaryReader reader) => Horario.fromMinutes(reader.read());

  @override
  void write(BinaryWriter writer, Horario obj) => writer.write(obj.asMinutes);
}
