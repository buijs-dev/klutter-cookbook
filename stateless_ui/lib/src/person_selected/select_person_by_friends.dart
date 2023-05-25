import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';

const MethodChannel _channel = MethodChannel(
    'dev.buijs.klutter.cookbook.examples.stateless_ui/channel/sync/person_selected');

extension SelectPersonByFriendsEvent on State {
  void selectPersonByFriends({
    required List message,
    void Function(void)? onSuccess,
    void Function(Exception)? onFailure,
    void Function()? onNullValue,
    void Function(AdapterResponse<void>)? onComplete,
  }) =>
      doEvent<void>(
        state: this,
        event: "selectPersonByFriends",
        channel: _channel,
        onSuccess: onSuccess,
        onFailure: onFailure,
        onNullValue: onNullValue,
        onComplete: onComplete,
      );
}

void selectPersonByFriends({
  required List message,
  State? state,
  void Function(void)? onSuccess,
  void Function(Exception)? onFailure,
  void Function()? onNullValue,
  void Function(AdapterResponse<void>)? onComplete,
}) =>
    doEvent<void>(
      state: state,
      event: "selectPersonByFriends",
      channel: _channel,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onNullValue: onNullValue,
      onComplete: onComplete,
      message: message,
    );
