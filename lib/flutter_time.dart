import 'dart:async';

import 'package:flutter/services.dart';

class FlutterTime {
  static const MethodChannel _channel =
      const MethodChannel('flutter_time');

  static Future<bool> get autoTimeIsEnable async {
    final bool autoTimeIsEnable = await _channel.invokeMethod('autoTimeIsEnable');
    return autoTimeIsEnable;
  }
}
