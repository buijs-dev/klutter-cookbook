import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';

const MethodChannel _channel = MethodChannel(
    'dev.buijs.klutter.cookbook.examples.stateless_ui/channel/sync/person_selected');

extension UpdateSelectedPersonIsHumanEvent on State {
  void updateSelectedPersonIsHuman({
    required bool message,
    void Function(void)? onSuccess,
    void Function(Exception)? onFailure,
    void Function()? onNullValue,
    void Function(AdapterResponse<void>)? onComplete,
  }) =>
      doEvent<void>(
        state: this,
        event: "updateSelectedPersonIsHuman",
        channel: _channel,
        onSuccess: onSuccess,
        onFailure: onFailure,
        onNullValue: onNullValue,
        onComplete: onComplete,
      );
}

void updateSelectedPersonIsHuman({
  required bool message,
  State? state,
  void Function(void)? onSuccess,
  void Function(Exception)? onFailure,
  void Function()? onNullValue,
  void Function(AdapterResponse<void>)? onComplete,
}) =>
    doEvent<void>(
      state: state,
      event: "updateSelectedPersonIsHuman",
      channel: _channel,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onNullValue: onNullValue,
      onComplete: onComplete,
      message: message,
    );
