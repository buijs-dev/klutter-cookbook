import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';

const MethodChannel _channel = MethodChannel(
    'dev.buijs.klutter.cookbook.examples.hello_world/channel/hello_world');

extension WhereAmIEvent on State {
  void askWhereAmI({
    void Function(String)? onSuccess,
    void Function(Exception)? onFailure,
    void Function()? onNullValue,
    void Function(AdapterResponse<String>)? onComplete,
  }) =>
      doEvent<String>(
        state: this,
        event: "whereAmI",
        channel: _channel,
        onSuccess: onSuccess,
        onFailure: onFailure,
        onNullValue: onNullValue,
        onComplete: onComplete,
      );
}

void askWhereAmI({
  State? state,
  void Function(String)? onSuccess,
  void Function(Exception)? onFailure,
  void Function()? onNullValue,
  void Function(AdapterResponse<String>)? onComplete,
}) =>
    doEvent<String>(
      state: state,
      event: "whereAmI",
      channel: _channel,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onNullValue: onNullValue,
      onComplete: onComplete,
    );
