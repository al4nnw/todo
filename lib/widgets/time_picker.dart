import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gradient_text_button.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            height: 180,
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: date,
                use24hFormat: true,
                onDateTimeChanged: (datetime) => date = datetime),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GradientTextButton(
              content: "Selecionar horário",
              onTap: () {
                Navigator.pop(context, date);
              },
              icon: Icons.alarm,
            ),
          )
        ],
      ),
    );
  }
}
