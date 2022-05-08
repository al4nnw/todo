import 'package:flutter/material.dart';
import 'package:todo_alan/styles/colors.dart';

class GradientTextButton extends StatelessWidget {
  final String content;
  final IconData icon;
  final Function() onTap;
  const GradientTextButton({
    Key? key,
    required this.content,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: free, borderRadius: const BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.zero,
      child: TextButton.icon(
          onPressed: onTap,
          style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: MaterialStateProperty.all(Size.zero),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
          label: Icon(icon, color: Colors.black),
          icon: Text(content,
              style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal))),
    );
  }
}
