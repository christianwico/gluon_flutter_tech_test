import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gluon_flutter_tech_test/widgets/common_widgets.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.title,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.prefixIcon,
    this.readOnly = false,
    this.controller,
    this.maxLines,
    this.inputFormatters,
  });

  final String? title;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool readOnly;
  final TextEditingController? controller;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _formKey = GlobalKey<FormState>();

  late final outlineColor = Theme.of(context).colorScheme.outline;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: _formFieldBuilder,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _formFieldBuilder(FormFieldState<String> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          _buildTitle(),
          CommonWidgets.verticalSpacer(),
        ],
        _buildTextFormField(state),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title!,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: outlineColor,
          ),
    );
  }

  Widget _buildTextFormField(FormFieldState<String> state) {
    final themeData = Theme.of(context);
    final border = state.hasError
        ? themeData.inputDecorationTheme.errorBorder
        : themeData.inputDecorationTheme.border;

    return TextFormField(
      key: _formKey,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.title,
        errorStyle: TextStyle(
          fontSize: 0.0,
          color: themeData.colorScheme.error,
        ),
        suffixIconColor: themeData.colorScheme.error,
        suffixIcon: state.hasError
            ? Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                message: state.errorText,
                preferBelow: false,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.error,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.info),
              )
            : null,
        border: border,
      ),
      onChanged: (value) {
        state.didChange(value);
        state.validate();
      },
    );
  }
}
