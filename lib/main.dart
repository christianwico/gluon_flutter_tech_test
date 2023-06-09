import 'package:flutter/material.dart';
import 'package:gluon_flutter_tech_test/features/widget_test/widget_test_page.dart';
import 'package:gluon_flutter_tech_test/resources/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: Strings.appTitle),
        '/widget-test': (context) => const WidgetTestPage(),
        // '/logic-test': (context) => const LogicTestPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/widget-test'),
              child: const Text('Go to ${Strings.widgetTestPageTitle}'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Go to ${Strings.logicTestPageTitle}'),
            ),
          ],
        ),
      ),
    );
  }
}
