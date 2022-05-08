import 'package:flutter/material.dart';
import 'package:todo_alan/models/atividade.dart';

import '../../models/horario.dart';
import '../../styles/colors.dart';
import 'atividade_card.dart';
import 'informative_app_bar.dart';
import '../modal/modal.dart';

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
                            duracaoEmMinutos: 10,
                            prioridade: 0,
                            completo: false),
                      )),
                  childCount: 2)),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const Modal(),
                    backgroundColor: Colors.transparent);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    gradient: p1,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 2, spreadRadius: 0.5, color: Colors.black54, offset: Offset(1, 2)),
                    ]),
                child: const Center(
                  child: Text("Adicionar atividade",
                      style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
