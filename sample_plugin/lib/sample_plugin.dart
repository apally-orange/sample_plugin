import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SamplePlugin {
  SamplePlugin(
    this.action,
  ) {
    _channel = const MethodChannel('sample_plugin');
    _channel.setMethodCallHandler(methodCallHandler);
  }

  MethodChannel _channel;
  VoidCallback action;

  Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> methodCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'test':
        action();
        return;

      default:
        throw MissingPluginException();
    }
  }
}
