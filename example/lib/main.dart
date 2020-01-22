import 'package:flutter/material.dart';
import 'dart:async';
import 'package:time/time.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _autoTimeIsEnable = false;

  @override
  void initState() {
    super.initState();
    autoTimeIsEnableState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> autoTimeIsEnableState() async {
    bool autoTimeIsEnable;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      autoTimeIsEnable = await Time.autoTimeIsEnable;
    } on Exception {
      autoTimeIsEnable = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _autoTimeIsEnable = autoTimeIsEnable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Auto time is enable: $_autoTimeIsEnable\n'),
        ),
      ),
    );
  }
}
