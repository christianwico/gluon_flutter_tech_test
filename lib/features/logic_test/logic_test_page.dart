import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gluon_flutter_tech_test/resources/dimens.dart';
import 'package:gluon_flutter_tech_test/resources/strings.dart';
import 'package:gluon_flutter_tech_test/utils/number_to_word_converter.dart';
import 'package:gluon_flutter_tech_test/widgets/common_widgets.dart';
import 'package:gluon_flutter_tech_test/widgets/custom_text_form_field.dart';

class LogicTestPage extends StatefulWidget {
  const LogicTestPage({super.key});

  @override
  State<LogicTestPage> createState() => _LogicTestPageState();
}

class _LogicTestPageState extends State<LogicTestPage> {
  final _outputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          CommonWidgets.verticalSpacer(height: Dimens.unit16),
          Form(
            key: _formKey,
            child: CustomTextFormField(
              title: Strings.logicTestPageInputTitle,
              validator: _inputFormFieldValidator,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              prefixIcon: const Icon(Icons.numbers),
              onSaved: _onSaved,
            ),
          ),
          CommonWidgets.verticalSpacer(),
          CustomTextFormField(
            controller: _outputController,
            title: Strings.logicTestPageOutputTitle,
            readOnly: true,
            prefixIcon: const Icon(Icons.edit),
            maxLines: 5,
          ),
          CommonWidgets.verticalSpacer(height: Dimens.unit16),
          ElevatedButton(
            onPressed: () => _formKey.currentState?.save(),
            child: const Text(Strings.logicTestPageConvert),
          ),
        ],
      ),
    );
  }

  void _onSaved(String? value) {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _outputController.text = 'INVALID INPUT';
      });

      return;
    }

    if (value != null && value.isNotEmpty) {
      final int? numericValue = int.tryParse(value);
      if (numericValue != null) {
        final String result = NumberToWordConverter.wordify(numericValue);

        setState(() {
          _outputController.text = result;
        });
      }
    }
  }

  String? _inputFormFieldValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      final int? numericValue = int.tryParse(value);
      if (numericValue != null) {
        return null;
      } else if (numericValue! < 0 || numericValue >= 999999999999999) {
        return 'Input must be between 0 and 999999999999999';
      } else {
        return 'Input must be numeric';
      }
    } else {
      return 'Input cannot be empty';
    }
  }
}
