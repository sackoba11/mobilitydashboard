import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

class CustomTextFieldLatLong extends StatelessWidget {
  const CustomTextFieldLatLong({
    super.key,
    required this.name,
    this.onDelete,
    required this.index,
  });
  final String name;
  final int index;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8),
            child: Text('Arrêt:$index'),
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'lat$name',
                  textInputAction: TextInputAction.next,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'valeur requise'),
                    FormBuilderValidators.latitude(
                        errorText: 'Mauvaise latitude'),
                  ]),
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'valeur requise'),
                    FormBuilderValidators.longitude(
                        errorText: 'Mauvaise longitude'),
                  ]),
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
              IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
