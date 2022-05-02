import 'package:flutter/material.dart';
import 'package:todo_alan/models/atividade.dart';

import '../../models/horario.dart';
import 'atividade_card.dart';
import 'informative_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(delegate: InformativeAppBar(), floating: true),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                ((context, index) => AtividadeCard(
                      atividade: Atividade(
                          horarioInicio: const Horario(hour: 8, minute: 0),
                          conteudo: "conteudo",
                          prioridade: 0,
                          completo: false),
                    )),
                childCount: 1))
      ],
    ));
  }
}
