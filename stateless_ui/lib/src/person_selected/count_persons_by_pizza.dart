import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';

import '../pizza_dataclass.dart';
import '../pizza_extensions.dart';

const MethodChannel _channel = MethodChannel(
    'dev.buijs.klutter.cookbook.examples.stateless_ui/channel/sync/person_selected');

extension CountPersonsByPizzaEvent on State {
  void countPersonsByPizza({
    required Pizza message,
    void Function(int)? onSuccess,
    void Function(Exception)? onFailure,
    void Function()? onNullValue,
    void Function(AdapterResponse<int>)? onComplete,
  }) =>
      doEvent<int>(
        state: this,
        event: "countPersonsByPizza",
        channel: _channel,
        onSuccess: onSuccess,
        onFailure: onFailure,
        onNullValue: onNullValue,
        onComplete: onComplete,
        encode: (dynamic data) => (data as Pizza).toJsonValue,
      );
}

void countPersonsByPizza({
  required Pizza message,
  State? state,
  void Function(int)? onSuccess,
  void Function(Exception)? onFailure,
  void Function()? onNullValue,
  void Function(AdapterResponse<int>)? onComplete,
}) =>
    doEvent<int>(
      state: state,
      event: "countPersonsByPizza",
      channel: _channel,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onNullValue: onNullValue,
      onComplete: onComplete,
      message: message,
      encode: (dynamic data) => (data as Pizza).toJsonValue,
    );
