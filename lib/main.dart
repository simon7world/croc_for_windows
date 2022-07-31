import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'navigation/navigation.dart';

void main() => runApp(const CrocApp());

class CrocApp extends StatefulWidget {
  const CrocApp({Key? key}) : super(key: key);

  final bool dark = true;

  @override
  State<CrocApp> createState() => _CrocAppState();
}

class _CrocAppState extends State<CrocApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // supportedLocales: S.delegate.supportedLocales,
      title: 'Croc for Windows',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: widget.dark ? ThemeMode.dark : ThemeMode.light,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
