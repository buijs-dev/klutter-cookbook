import 'package:flutter/material.dart';
import 'package:stateless_ui/stateless_ui.dart';

import 'buttons.dart';

final AppBar _appBar =
    AppBar(backgroundColor: Colors.black87, title: const Text('Person'));

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: _appBar,
      backgroundColor: Colors.indigo,
      body: Stack(
        children: [
          PersonSelected(builder: (Person? person) {
            if(person == null) {
              Future<dynamic>.delayed(Duration(seconds: 1)).then((dynamic _) {
                selectPersonById(message: 1);
              });
            }

            return person == null
                ? SizedBox()
                : PersonDetails(person);
          }),

          Positioned(
              bottom: 30,
              right: 30,
              child: MyOutlinedButton(text: 'Next!', onPressed: selectNextPerson))
        ],
      ),
  );
}
class PersonDetails extends StatelessWidget {
  const PersonDetails(this.person, {Key? key}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PersonDetailsText("Name: ${person.name}"),
          PersonDetailsText(
              "Born: ${person.bornOnPlanet.toJsonValue.toLowerCase()}"),
          PersonDetailsText("Age: ${person.age}"),
        ],
      ),
    );
  }
}

class PersonDetailsText extends StatelessWidget {
  const PersonDetailsText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(color: Colors.white, fontSize: 30));
}
