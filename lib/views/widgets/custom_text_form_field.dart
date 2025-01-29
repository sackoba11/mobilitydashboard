import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String id;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.textEditingController,
    required this.textInputType,
    required this.id,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: id,
      keyboardType: textInputType,
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(width: 0.4, color: context.colors.textColor))),
      onSaved: (newValue) {
        if (newValue != null && newValue.isNotEmpty) {
          textEditingController.text = newValue;
        }
      },
      validator: validator,
      // initialValue: '12',

      textInputAction: TextInputAction.next,
    );
  }
}
