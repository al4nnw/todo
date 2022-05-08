import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/contador_horario.dart';

class ContadorDuracao extends StatefulWidget {
  final ContadorHorario contador;
  const ContadorDuracao({
    Key? key,
    required this.contador,
  }) : super(key: key);

  @override
  State<ContadorDuracao> createState() => ContadorDuracaoState();
}

class ContadorDuracaoState extends State<ContadorDuracao> {
  late final void Function() _setState;

  @override
  void initState() {
    super.initState();
    _setState = () {
      setState(() {});
    };

    widget.contador.addListener(_setState);
  }

  @override
  void dispose() {
    widget.contador.removeListener(_setState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text("Duração da atividade",
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        Text(widget.contador.toString(),
            style: const TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.normal)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Toolbar(
              isPositive: false,
              contador: widget.contador,
            ),
            _Toolbar(
              isPositive: true,
              contador: widget.contador,
            )
          ],
        ),
      ],
    );
  }
}

class _Toolbar extends StatelessWidget {
  final ContadorHorario contador;
  final bool isPositive;
  const _Toolbar({
    Key? key,
    required this.isPositive,
    required this.contador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String simbolo = isPositive ? "+" : "-";
    return Row(
      children: isPositive
          ? [
              CounterTimeOptions(
                content: simbolo + "1h",
                onTap: _update,
                minuteValue: 60,
              ),
              CounterTimeOptions(
                content: simbolo + "30m",
                onTap: _update,
                minuteValue: 30,
              ),
              CounterTimeOptions(
                content: simbolo + "1m",
                onTap: _update,
                minuteValue: 1,
              ),
            ].reversed.toList()
          : [
              CounterTimeOptions(
                content: simbolo + "1h",
                onTap: _update,
                minuteValue: 60,
              ),
              CounterTimeOptions(
                content: simbolo + "30m",
                onTap: _update,
                minuteValue: 30,
              ),
              CounterTimeOptions(
                content: simbolo + "1m",
                onTap: _update,
                minuteValue: 1,
              ),
            ],
    );
  }

  void _update(int minutes) {
    if (isPositive) {
      contador.addMinute(minutes);
    } else {
      contador.subMinute(minutes);
    }
  }
}

class CounterTimeOptions extends StatefulWidget {
  final String content;
  final int minuteValue;
  final Function(int minutes) onTap;
  const CounterTimeOptions({
    Key? key,
    required this.content,
    required this.onTap,
    required this.minuteValue,
  }) : super(key: key);

  @override
  State<CounterTimeOptions> createState() => _CounterTimeOptionsState();
}

class _CounterTimeOptionsState extends State<CounterTimeOptions> {
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => widget.onTap(widget.minuteValue),
        onTapUp: (details) => _timer.cancel(),
        onTapDown: (details) => _timer = Timer.periodic(
          const Duration(milliseconds: 100),
          (t) => widget.onTap(widget.minuteValue),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(widget.content, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
