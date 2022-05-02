import 'horario.dart';

class Atividade {
  Horario horarioInicio;
  Horario? horarioTermino;
  String conteudo;
  int prioridade;
  bool completo;

  Atividade({
    required this.horarioInicio,
    this.horarioTermino,
    required this.conteudo,
    required this.prioridade,
    required this.completo,
  });
}
