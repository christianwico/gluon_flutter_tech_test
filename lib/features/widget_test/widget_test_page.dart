import 'package:flutter/material.dart';
import 'package:gluon_flutter_tech_test/resources/dimens.dart';
import 'package:gluon_flutter_tech_test/resources/strings.dart';
import 'package:gluon_flutter_tech_test/widgets/common_widgets.dart';
import 'package:gluon_flutter_tech_test/widgets/custom_text_form_field.dart';

class WidgetTestPage extends StatefulWidget {
  const WidgetTestPage({super.key});

  @override
  State<WidgetTestPage> createState() => _WidgetTestPageState();
}

class _WidgetTestPageState extends State<WidgetTestPage> {
  final _formKey = GlobalKey<FormState>();

  String? _value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(title: const Text(Strings.widgetTestPageTitle)),
        body: Padding(
          padding: const EdgeInsets.all(Dimens.unit16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: CustomTextFormField(
                    title: Strings.usernameFormFieldTitle,
                    initialValue: _value,
                    validator: _usernameFormFieldValidator,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                CommonWidgets.verticalSpacer(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: const Text(Strings.submit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _usernameFormFieldValidator(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : 'Username cannot be empty';
  }
}
