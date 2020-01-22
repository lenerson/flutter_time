import 'dart:async';

import 'package:flutter/services.dart';

class Time {
  static const MethodChannel _channel =
      const MethodChannel('time');

  static Future<bool> get autoTimeIsEnable async {
    final bool autoTimeIsEnable = await _channel.invokeMethod('autoTimeIsEnable');
    return autoTimeIsEnable;
  }
}
