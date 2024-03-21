import 'package:flutter/material.dart';
import 'package:stateless_ui_example/src/person_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(home: PersonScreen());
}
