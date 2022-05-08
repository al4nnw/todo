import 'horario.dart';

class Atividade {
  Horario horarioInicio;
  Horario? horarioTermino;
  String conteudo;

  int prioridade;
  bool completo;
  int duracaoEmMinutos;

  Atividade({
    required this.horarioInicio,
    required this.conteudo,
    required this.duracaoEmMinutos,
    required this.prioridade,
    required this.completo,
  }) : assert(duracaoEmMinutos >= 0, "É impossível criar uma atividade com duração negativa.") {
    if (duracaoEmMinutos != 0) horarioTermino = Horario.fromMinutes(duracaoEmMinutos);
  }
}
