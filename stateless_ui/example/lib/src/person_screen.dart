import 'package:flutter/material.dart';
import 'package:stateless_ui/stateless_ui.dart';

final AppBar _appBar = AppBar(
    backgroundColor: Colors.black87,
    title: const Text('Person'));

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      PersonSelected(child: (person) =>
          Scaffold(
              appBar: _appBar,
              backgroundColor: Colors.indigo,
              body: person == null
                  ? MissingPerson()
                  : PersonDetails(person)));

}

class MissingPerson extends StatelessWidget {
  const MissingPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Oops... missing person!',
      style: TextStyle(color: Colors.white)));
  }
}

class PersonDetails extends StatelessWidget {
  const PersonDetails(this.person,{Key? key}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PersonDetailsText("Name: ${person.name}"),
          PersonDetailsText("Born: ${person.bornOnPlanet.toJsonValue.toLowerCase()}"),
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
