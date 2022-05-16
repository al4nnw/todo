import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  late Iterable atividades;

  @override
  void initState() {
    atividades = [];
    super.initState();
    Hive.openBox("atividades").then((value) => setState(() => atividades = value.values));
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
                          atividade: atividades.elementAt(index),
                        )),
                    childCount: atividades.length)),
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
