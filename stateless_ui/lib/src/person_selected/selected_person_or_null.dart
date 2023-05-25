import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';

import '../person_dataclass.dart';
import '../person_extensions.dart';

const MethodChannel _channel = MethodChannel(
    'dev.buijs.klutter.cookbook.examples.stateless_ui/channel/sync/person_selected');

extension SelectedPersonOrNullEvent on State {
  void selectedPersonOrNull({
    void Function(Person)? onSuccess,
    void Function(Exception)? onFailure,
    void Function()? onNullValue,
    void Function(AdapterResponse<Person>)? onComplete,
  }) =>
      doEvent<Person>(
        state: this,
        event: "selectedPersonOrNull",
        channel: _channel,
        onSuccess: onSuccess,
        onFailure: onFailure,
        onNullValue: onNullValue,
        onComplete: onComplete,
        decode: (String json) => json.toPerson,
      );
}

void selectedPersonOrNull({
  State? state,
  void Function(Person)? onSuccess,
  void Function(Exception)? onFailure,
  void Function()? onNullValue,
  void Function(AdapterResponse<Person>)? onComplete,
}) =>
    doEvent<Person>(
      state: state,
      event: "selectedPersonOrNull",
      channel: _channel,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onNullValue: onNullValue,
      onComplete: onComplete,
      decode: (String json) => json.toPerson,
    );
