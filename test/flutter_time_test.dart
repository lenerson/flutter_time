import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_time/flutter_time.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_time');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('autoTimeIsEnable', () async {
    expect(await FlutterTime.autoTimeIsEnable, false);
  });
}
