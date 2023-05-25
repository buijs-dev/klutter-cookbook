import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';
import '../person_dataclass.dart';
import '../person_extensions.dart';

const _stream = EventChannel(
    'dev.buijs.klutter.cookbook.examples.stateless_ui/channel/async/person_selected');

class PersonSelected extends Subscriber<Person> {
  const PersonSelected({
    required Widget Function(Person?) child,
    Key? key,
  }) : super(
          child: child,
          channel: _stream,
          topic: "person_selected",
          key: key,
        );

  @override
  Person decode(dynamic json) => (json as String).toPerson;
}
