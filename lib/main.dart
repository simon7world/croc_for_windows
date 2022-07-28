import 'package:flutter/material.dart';

import 'package:croc_for_windows/navigation/navigation.dart';
import 'package:croc_for_windows/work/work.dart';

void main() => runApp(const CrocApp());

class CrocApp extends StatelessWidget {
  const CrocApp({Key? key}) : super(key: key);

  final bool dark = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Croc for Windows',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: const <Widget>[
          NavigationBox(),
          // WorkBox(),
        ],
      ),
    );
  }
}
