import 'package:flutter/material.dart';
import 'package:gluon_flutter_tech_test/resources/dimens.dart';
import 'package:gluon_flutter_tech_test/resources/strings.dart';
import 'package:gluon_flutter_tech_test/widgets/common_widgets.dart';
import 'package:gluon_flutter_tech_test/widgets/custom_text_form_field.dart';

class LogicTestPage extends StatefulWidget {
  const LogicTestPage({super.key});

  @override
  State<LogicTestPage> createState() => _LogicTestPageState();
}

class _LogicTestPageState extends State<LogicTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Strings.logicTestPageTitle)),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.unit16),
      child: Column(
        children: [
          const Text(Strings.logicTestPageHeader),
          CommonWidgets.verticalSpacer(),
          CustomTextFormField(
            title: Strings.logicTestPageInputTitle,
            validator: _inputFormFieldValidator,
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.numbers),
          ),
        ],
      ),
    );
  }

  String? _inputFormFieldValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (int.tryParse(value) != null) {
        return null;
      } else {
        return 'Input must be numeric';
      }
    } else {
      return 'Input cannot be empty';
    }
  }
}
