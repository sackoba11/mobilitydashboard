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
      textInputAction: TextInputAction.next,
    );
  }
}

class NewTextFieldLatLong extends StatelessWidget {
  const NewTextFieldLatLong({
    super.key,
    required this.name,
    this.onDelete,
    this.validator,
  });
  final String name;
  final VoidCallback? onDelete;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8),
          child: Text('Arrêt:0'),
        ),
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'lat$name',
                validator: validator,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'lat',
                    hintText: 'latitude',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 0.4, color: context.colors.textColor))),
              ),
            ),
            context.gaps.small,
            Expanded(
              child: FormBuilderTextField(
                name: 'long$name',
                validator: validator,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'long',
                    hintText: 'longitude',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            width: 0.4, color: context.colors.textColor))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
