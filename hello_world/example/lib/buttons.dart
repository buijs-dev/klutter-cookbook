import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    required this.onPressed,
    required this.text,
    Key? key}) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
      child: Text(text, style: TextStyle(color: Colors.indigo)),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
      onPressed: onPressed);

}
