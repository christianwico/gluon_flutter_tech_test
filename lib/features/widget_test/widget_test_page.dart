import 'package:flutter/material.dart';
import 'package:gluon_flutter_tech_test/resources/strings.dart';

class WidgetTestPage extends StatefulWidget {
  const WidgetTestPage({super.key});

  @override
  State<WidgetTestPage> createState() => _WidgetTestPageState();
}

class _WidgetTestPageState extends State<WidgetTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.widgetTestPageTitle)),
    );
  }
}
