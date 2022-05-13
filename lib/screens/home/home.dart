import 'package:flutter/material.dart';
import 'package:todo_alan/models/atividade.dart';
import 'package:todo_alan/models/horario.dart';

import '../../styles/colors.dart';
import 'atividade_card.dart';
import 'informative_app_bar.dart';
import '../modal/modal.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Atividade> atividades = [
    Atividade(
        horarioInicio: const Horario(hour: 8, minute: 29),
        conteudo: "conteudo",
        duracaoEmMinutos: 10,
        prioridade: 0,
        completo: false)
  ];

  @override
  void initState() {
    super.initState();
    print(atividades);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(delegate: InformativeAppBar(), floating: true),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    ((context, index) => AtividadeCard(
                          atividade: atividades[0],
                        )),
                    childCount: 10)),
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
                child: Card(
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(55)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      gradient: free,
                    ),
                    child: const Center(
                      child: Text("Adicionar atividade",
                          style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            )),
            const SliverToBoxAdapter(
              child: SizedBox(height: 40),
            )
          ],
        ),
      ),
    );
  }
}
