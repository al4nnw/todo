import 'package:hive_flutter/hive_flutter.dart';

import 'horario.dart';
part "atividade.g.dart";

@HiveType(typeId: 1)
class Atividade {
  @HiveField(0)
  Horario horarioInicio;

  @HiveField(1)
  Horario? horarioTermino;

  @HiveField(2)
  String conteudo;

  @HiveField(3)
  int prioridade;

  @HiveField(4)
  bool completo;

  @HiveField(5)
  int duracaoEmMinutos;

  Atividade({
    required this.horarioInicio,
    required this.conteudo,
    required this.duracaoEmMinutos,
    required this.prioridade,
    required this.completo,
  }) : assert(duracaoEmMinutos >= 0, "É impossível criar uma atividade com duração negativa.") {
    if (duracaoEmMinutos != 0) {
      final minutos = horarioInicio.asMinutes + duracaoEmMinutos;
      print(minutos);
      horarioTermino = Horario.fromMinutes(minutos);
    }
  }
}
