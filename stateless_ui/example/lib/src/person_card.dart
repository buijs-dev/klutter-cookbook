import 'package:flutter/material.dart';
import 'package:stateless_ui/stateless_ui.dart';
import 'package:stateless_ui_example/src/person_screen.dart';

import 'person_decorators.dart';
import 'buttons.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({required this.person, Key? key}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: person.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: person.image,
              title: Text(person.name,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
              subtitle: Text('A person born on planet ${person.bornOnPlanet.toJsonValue.toLowerCase()}.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('MORE', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    selectPersonByName(
                        message: person.name,
                        onSuccess: (_) => Navigator.of(context).push(_navigateToPersonDetails()),
                        onFailure: (Exception msg) => context.showUnknowPersonMessage("$msg")
                    );
                  }
                ),
                const SizedBox(width: 8),
                // TODO
                // TextButton(
                //   child: const Text('EDIT', style: TextStyle(color: Colors.white)),
                //   onPressed: () {
                //
                //   },
                // ),
                // const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on BuildContext {
  Future<void> showUnknowPersonMessage(String message) async =>
      showDialog<void>(
          context: this,
          barrierDismissible: true,
          builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.indigoAccent,
              title: const Text('Person not found', style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              )),
              content: Text(message, style: TextStyle(color: Colors.white70),),
              actions: <Widget>[
                MyOutlinedButton(
                    text: 'Close',
                    onPressed: () => Navigator.of(context).pop()),
              ]));
}

Route _navigateToPersonDetails() => PageRouteBuilder<PersonScreen>(
  pageBuilder: (context, animation, secondaryAnimation) => PersonScreen(),
  transitionDuration: Duration(milliseconds: 1000),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );},
);
