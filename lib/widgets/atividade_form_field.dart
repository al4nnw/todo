import 'package:flutter/material.dart';

class AtividadeFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final int? minLines;
  final int? maxLines;

  const AtividadeFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1), borderRadius: BorderRadius.all(Radius.circular(15))),
          label: Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        ),
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal, letterSpacing: 1));
  }
}
