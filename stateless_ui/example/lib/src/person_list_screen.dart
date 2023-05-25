import 'package:flutter/material.dart';
import 'package:stateless_ui/stateless_ui.dart';

import 'person_card.dart';

final AppBar _appBar = AppBar(
    backgroundColor: Colors.black87,
    title: const Text('Persons'));

class PersonListScreen extends StatelessWidget {
  const PersonListScreen({Key? key}) : super(key: key);

  /// Tell the backend to emit a PersonDatabaseSnapshot.
  /// When emitted then PersonList widget will automatically rebuild.
  Future<void> _pullRefresh() async {
    emitPersonsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar,
        backgroundColor: Colors.indigo,
        body: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: ListView(
            children: [
              PersonList(
                  child: (PersonDatabaseSnapshot? snapshot) {
                    final data = snapshot?.persons ?? <int, Person>{};
                    if(data.isEmpty) {
                      return GestureDetector(
                          onTap: emitPersonsFromDatabase,
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Center(child: Text('REFRESH'))));
                    } else {
                      return Column(children: data.values.map((e) => PersonCard(person: e)).toList());
                    }
                  }
              )
            ],
          ),
        ));
  }
}