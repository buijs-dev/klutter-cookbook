import 'package:flutter/material.dart';
import 'package:hello_world/hello_world.dart';

import 'buttons.dart';

extension WhereAmIButton on BuildContext {
  Widget get whereAmIButton => MyOutlinedButton(
      text: 'Ask where I am',
      onPressed: () => Navigator.of(this)
          .push(MaterialPageRoute<WhereAmI>(builder: (context) => WhereAmI())));
}

class WhereAmI extends StatefulWidget {
  const WhereAmI({Key? key}) : super(key: key);

  @override
  State<WhereAmI> createState() => _WhereAmIState();
}

class _WhereAmIState extends State<WhereAmI> {

  String? platform;
  String? exception;

  @override
  void initState() {
    super.initState();
    askWhereAmI(state: this,
        onSuccess: (value) => this.platform = value,
        onFailure: (exception) => this.exception = "$exception",
        onComplete: (_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if(platform != null)
      return _Message(message: platform!, color: Colors.green);

    if(exception != null)
      return _Message(message: exception!, color: Colors.red);

    return  _Message(message: "Excuse me... where am I?", color: Colors.grey);
  }

}

class _Message extends StatelessWidget {
  const _Message({
    required this.color,
    required this.message,
    Key? key}) : super(key: key);

  final Color color;
  final String message;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      backgroundColor: color,
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message,
                    style: TextStyle(
                        color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                SizedBox(height: 10.0),
                MyOutlinedButton(
                  text: 'Close',
                  onPressed: () => Navigator.of(context).pop())
              ]),
          )),
    ),
  );

}
