import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: WidgetWithState(),
    );
  }
}


class WidgetWithoutState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogo();
  }
}

class WidgetWithState extends StatefulWidget {
  @override
  _WidgetWithState createState() {
    return _WidgetWithState();
  }
}

class _WidgetWithState extends State<WidgetWithState> {
  var _size = 32.0;

  void _increase() {
    setState(() {
      _size = _size + 16;
    });
  }

  void _decrease() {
    if(_size >= 16.0) {
      setState(() {
        _size = _size - 16;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoButton Sample'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlutterLogo(size: _size),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {
                _decrease();
              },
              child: const Text('-'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {
                _increase();
              },
              child: const Text('+'),
            ),
          ],
        ),
      ),
    );
  }
}
