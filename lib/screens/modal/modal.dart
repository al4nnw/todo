import 'package:flutter/material.dart';
import 'package:todo_alan/widgets/atividade_form_field.dart';

import '../../models/contador_horario.dart';
import '../../styles/colors.dart';
import '../../widgets/gradient_text_button.dart';
import 'campo_contador.dart';

class Modal extends StatefulWidget {
  const Modal({Key? key}) : super(key: key);

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  late TextEditingController nomeController;
  late TextEditingController descricaoController;
  ContadorHorario contador = ContadorHorario(0);
  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    descricaoController = TextEditingController();
  }

  @override
  void dispose() {
    nomeController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AtividadeFormField(
                  controller: nomeController,
                  label: "Nome",
                  hintText: "Insira o nome da atividade",
                ),
                const SizedBox(height: 20),
                AtividadeFormField(
                  controller: descricaoController,
                  label: "Descrição",
                  hintText: "Insira uma descrição",
                ),
                const SizedBox(height: 10),
                const Text("Horário de início",
                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    showTimePicker(context: context, initialTime: TimeOfDay.now());
                  },
                  child: Card(
                    elevation: 5,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: free, borderRadius: const BorderRadius.all(Radius.circular(45))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.alarm,
                              color: principal,
                            ),
                            SizedBox(width: 20),
                            Text("Toque para definir o horário",
                                style: TextStyle(fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ContadorDuracao(
                  contador: contador,
                ),
                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.center,
                    child: GradientTextButton(content: "Criar atividade", icon: Icons.add, onTap: () {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
