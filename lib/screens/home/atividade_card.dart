import 'package:flutter/material.dart';
import 'package:todo_alan/models/atividade.dart';
import 'package:todo_alan/models/horario.dart';

import '../../styles/colors.dart';

class AtividadeCard extends StatelessWidget {
  final Atividade atividade;
  const AtividadeCard({
    Key? key,
    required this.atividade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          gradient: p0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              _Clock(
                horarioInicio: atividade.horarioInicio,
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Acordar",
                            style:
                                TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.normal)),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class _Clock extends StatelessWidget {
  final Horario horarioInicio;
  final Horario? horarioTermino;
  const _Clock({Key? key, required this.horarioInicio, this.horarioTermino}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String content = horarioInicio.toString();
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          children: [
            const Icon(Icons.alarm, size: 20),
            const SizedBox(width: 10),
            Text(content,
                style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
