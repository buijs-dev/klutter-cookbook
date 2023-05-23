import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:klutter_ui/klutter_ui.dart';

const MethodChannel _channel = MethodChannel(
    'dev.buijs.klutter.cookbook.examples.hello_world/channel/hello_world');

extension WelcomeMessageEvent on State {
  void sayWelcomeUser({
    required String message,
    void Function(String)? onSuccess,
    void Function(Exception)? onFailure,
    void Function()? onNullValue,
    void Function(AdapterResponse<String>)? onComplete,
  }) =>
      doEvent<String>(
        state: this,
        event: "welcomeMessage",
        channel: _channel,
        onSuccess: onSuccess,
        onFailure: onFailure,
        onNullValue: onNullValue,
        onComplete: onComplete,
      );
}

void sayWelcomeUser({
  required String message,
  State? state,
  void Function(String)? onSuccess,
  void Function(Exception)? onFailure,
  void Function()? onNullValue,
  void Function(AdapterResponse<String>)? onComplete,
}) =>
    doEvent<String>(
      state: state,
      event: "welcomeMessage",
      channel: _channel,
      onSuccess: onSuccess,
      onFailure: onFailure,
      onNullValue: onNullValue,
      onComplete: onComplete,
      message: message,
    );
