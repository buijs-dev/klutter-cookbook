import 'package:flutter/material.dart';
import 'package:hello_world/hello_world.dart';

import 'buttons.dart';

extension WelcomeButton on BuildContext {
  Widget get sayHelloButton => MyOutlinedButton(
      text: 'Say Hello',
      onPressed: () {
        Navigator.of(this)
            .push(MaterialPageRoute<Welcome>(builder: (context) => Welcome()));
      });
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String username = "";

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                    onChanged: (username) => this.username = username,
                    style: TextStyle(color: Colors.white70),
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70)),
                        hintStyle: TextStyle(color: Colors.white70),
                        labelStyle: TextStyle(color: Colors.white70),
                        labelText: 'Enter your name')),
                MyOutlinedButton(
                    text: "Confirm",
                    onPressed: () {
                      sayWelcomeUser(
                          message: username,
                          onSuccess: (value) {
                            context.showWelcomeDialog(value);
                          },
                          onComplete: (_) => setState(() {}));
                    }),
                MyOutlinedButton(
                    text: 'Close', onPressed: () => Navigator.of(context).pop())
              ],
            ),
          ),
        ),
      );
}

extension on BuildContext {
  Future<void> showWelcomeDialog(String greeting) async => showDialog<void>(
      context: this,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.indigoAccent,
              title: const Text('Welcome',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              content: Text(
                greeting,
                style: TextStyle(color: Colors.white70),
              ),
              actions: <Widget>[
                MyOutlinedButton(
                    text: 'Close',
                    onPressed: () => Navigator.of(context).pop()),
              ]));
}
