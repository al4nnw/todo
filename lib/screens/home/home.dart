import 'package:flutter/material.dart';

import '../../styles/colors.dart';
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
            delegate: SliverChildBuilderDelegate(((context, index) => const AtividadeCard()), childCount: 50))
      ],
    ));
  }
}

class AtividadeCard extends StatelessWidget {
  const AtividadeCard({
    Key? key,
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
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Row(
                    children: const [
                      Icon(Icons.alarm, size: 20),
                      SizedBox(width: 10),
                      Text("08:00 - 8:30",
                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
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
