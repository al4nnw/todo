import 'package:flutter/material.dart';

class Horario extends TimeOfDay {
  const Horario({required int hour, required int minute}) : super(hour: hour, minute: minute);

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
