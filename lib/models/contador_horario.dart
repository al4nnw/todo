import 'package:flutter/foundation.dart';

class ContadorHorario extends ValueNotifier<int> {
  ContadorHorario(int value) : super(value);

  void addMinute(int amount) => value += amount;

  void subMinute(int amount) {
    if (value - amount < 0) return;
    value -= amount;
  }

  @override
  String toString() {
    if (value < 60) {
      return value.toString() + "m";
    } else {
      int hours = value ~/ 60;
      int minutes = value - (hours * 60);
      return hours.toString() + "h" + minutes.toString() + "m";
    }
  }
}
