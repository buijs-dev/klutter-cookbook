import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';
import '../person_database_snapshot_dataclass.dart';
import '../person_database_snapshot_extensions.dart';

const _stream = EventChannel(
    'dev.buijs.klutter.cookbook.examples.stateless_ui/channel/async/person_list');

class PersonList extends Subscriber<PersonDatabaseSnapshot> {
  const PersonList({
    required Widget Function(PersonDatabaseSnapshot?) child,
    Key? key,
  }) : super(
          child: child,
          channel: _stream,
          topic: "person_list",
          key: key,
        );

  @override
  PersonDatabaseSnapshot decode(dynamic json) =>
      (json as String).toPersonDatabaseSnapshot;

}
