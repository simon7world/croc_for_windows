import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrocApp());
}

class CrocApp extends StatelessWidget {
  const CrocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Croc for Windows',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MainPage(title: 'Croc for Windows'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _counter = 0;
  var c = Colors.deepOrange;

  void _incrementCounter() {
    setState(() {
      log("+");
      print("+");

      _counter++;
    });
  }

  void _changeColor(event) {
    setState(() {
      if (event is PointerEnterEvent) {
        c = Colors.teal;
      } else if (event is PointerExitEvent) {
        c = Colors.deepOrange;
      } else {
        c = Colors.yellow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MouseRegion(
            onEnter: _changeColor,
            onExit: _changeColor,
            child: GestureDetector(
              onTap: _incrementCounter,
              child: Image.asset("images/logo.jpg"),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: c,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text('You have pushed the button this many times:'),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
