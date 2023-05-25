import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';

const MethodChannel _channel = MethodChannel(
    'dev.buijs.klutter.cookbook.examples.stateless_ui/channel/sync/person_selected');

extension SelectPersonByPizzaAddictionLevelEvent on State {
  void selectPersonByPizzaAddictionLevel({
    required double message,
    void Function(void)? onSuccess,
    void Function(Exception)? onFailure,
    void Function()? onNullValue,
    void Function(AdapterResponse<void>)? onComplete,
  }) =>
      doEvent<void>(
        state: this,
        event: "selectPersonByPizzaAddictionLevel",
        channel: _channel,
        onSuccess: onSuccess,
        onFailure: onFailure,
        onNullValue: onNullValue,
        onComplete: onComplete,
      );
}

void selectPersonByPizzaAddictionLevel({
  required double message,
  State? state,
  void Function(void)? onSuccess,
  void Function(Exception)? onFailure,
  void Function()? onNullValue,
  void Function(AdapterResponse<void>)? onComplete,
}) =>
    doEvent<void>(
      state: state,
      event: "selectPersonByPizzaAddictionLevel",
      channel: _channel,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onNullValue: onNullValue,
      onComplete: onComplete,
      message: message,
    );
