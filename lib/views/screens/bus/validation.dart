import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

class DynamicFormFields extends StatefulWidget {
  final List<Widget> columns;

  const DynamicFormFields({super.key, required this.columns});

  @override
  State<DynamicFormFields> createState() => _DynamicFormFieldsState();
}

class _DynamicFormFieldsState extends State<DynamicFormFields> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<Widget> fields = [];
  var _newTextFieldId = 0;
  String savedValue = '';

  @override
  void initState() {
    savedValue = _formKey.currentState?.value.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      clearValueOnUnregister: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var column in widget.columns) column,
              ...fields,
              context.gaps.large,
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Valider'),
                      onPressed: () {
                        _formKey.currentState!.saveAndValidate();
                        setState(() {
                          savedValue =
                              _formKey.currentState?.value.toString() ?? '';
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text("Add field"),
                      onPressed: () {
                        final newTextFieldName = 'name_${_newTextFieldId++}';
                        final newTextFieldKey = ValueKey(_newTextFieldId);
                        setState(() {
                          fields.add(NewTextField(
                            key: newTextFieldKey,
                            name: newTextFieldName,
                            onDelete: () {
                              setState(() {
                                fields.removeWhere(
                                    (e) => e.key == newTextFieldKey);
                              });
                            },
                          ));
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Divider(height: 40),
              Text('Saved value: $savedValue'),
            ],
          ),
        ),
      ),
    );
  }
}

class NewTextField extends StatelessWidget {
  const NewTextField({
    super.key,
    required this.name,
    this.onDelete,
  });
  final String name;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: FormBuilderTextField(
              name: 'lat$name',
              validator: FormBuilderValidators.latitude(errorText: 'error'),
              decoration: InputDecoration(
                  labelText: 'lat',
                  hintText: 'latitude',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          width: 0.4, color: context.colors.textColor))),
            ),
          ),
          // Expanded(
          //   child: FormBuilderTextField(
          //     name: 'long$name',
          //     validator: FormBuilderValidators.longitude(),
          //     decoration: InputDecoration(
          //         labelText: 'long',
          //         hintText: 'longitude',
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(8),
          //             borderSide: BorderSide(
          //                 width: 0.4, color: context.colors.textColor))),
          //   ),
          // ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
