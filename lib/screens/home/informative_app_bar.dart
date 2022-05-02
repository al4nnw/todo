import 'package:flutter/material.dart';
import 'package:todo_alan/styles/colors.dart';

class InformativeAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: const ColoredBox(
              color: Colors.white,
            ),
          ),
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.lerp(
                  const EdgeInsets.only(left: 10, top: 20),
                  const EdgeInsets.all(0),
                  progress,
                )!,
                child: Align(
                  alignment: Alignment.lerp(
                    Alignment.centerLeft,
                    Alignment.centerRight,
                    progress,
                  )!,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: free, borderRadius: const BorderRadius.all(Radius.circular(45))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Text(
                        'Segunda',
                        style: TextStyle.lerp(
                          const TextStyle(fontSize: 30, color: Colors.black),
                          const TextStyle(fontSize: 20, color: Colors.black),
                          progress,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(1, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Atividade atual",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 5),
                        const Text("Acordar"),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("8:00"),
                            Text("8:30"),
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.8,
                          backgroundColor: Color.fromRGBO(35, 57, 91, 0.2),
                          valueColor: AlwaysStoppedAnimation(Color.fromRGBO(35, 57, 91, 0.95)),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: free, borderRadius: const BorderRadius.all(Radius.circular(15))),
                            padding: EdgeInsets.zero,
                            child: TextButton.icon(
                                onPressed: () {},
                                style: ButtonStyle(
                                    splashFactory: NoSplash.splashFactory,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    minimumSize: MaterialStateProperty.all(Size.zero),
                                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                                label: const Icon(Icons.check, color: Colors.black),
                                icon: const Text("Completar atividade",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 264;

  @override
  double get minExtent => 84;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
