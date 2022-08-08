import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constant/const.dart';
import 'constant/enums.dart';
import 'generated/l10n.dart';
import 'navigation/navigation.dart';
import 'work/work.dart';

void main() async {
  await Config.load();

  runApp(const CrocApp());

  doWhenWindowReady(() {
    appWindow.size = appWindow.minSize = const Size(900, 600);
    appWindow.title = "$AppName($AppShortName)";
    appWindow.show();
  });
}

class CrocApp extends StatefulWidget {
  const CrocApp({Key? key}) : super(key: key);

  @override
  State<CrocApp> createState() => _CrocAppState();
}

class _CrocAppState extends State<CrocApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppLightTheme,
      builder: (final context, final bool light, final child) {
        return ValueListenableBuilder(
          valueListenable: AppLang,
          builder: (final context, final Lang lang, final child) {
            return ValueListenableBuilder(
                valueListenable: AppPrimaryColor,
                builder: (final context, final Color color, final child) {
                  return MaterialApp(
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: lang.locale,
                    title: AppName,
                    theme: ThemeData(
                      brightness: Brightness.light,
                      primarySwatch: color.value,
                      fontFamily: AppFontFamily,
                    ),
                    darkTheme: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: color.value,
                      fontFamily: AppFontFamily,
                    ),
                    themeMode: light ? ThemeMode.light : ThemeMode.dark,
                    home: const MainPage(),
                  );
                });
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Material(
      child: WindowBorder(
        width: 3,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: const <Widget>[
            NavigationBox(),
            WorkBox(),
          ],
        ),
      ),
    );
  }
}
