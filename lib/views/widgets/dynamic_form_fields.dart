import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

import 'custom_button.dart';
import 'custom_text_field_lat_long.dart';

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
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var column in widget.columns) column,
              ...fields,
              context.gaps.large,
              Row(
                children: <Widget>[
                  Expanded(
                      child: CustomButton(
                    isBorder: true,
                    title: 'Valider',
                    onPressed: () {
                      _formKey.currentState!.saveAndValidate();
                      setState(() {
                        savedValue =
                            _formKey.currentState?.value.toString() ?? '';
                      });
                      Navigator.of(context).pop();
                      print('Saved value: $savedValue');
                    },
                  )),
                  context.gaps.normal,
                  Expanded(
                      child: CustomButton(
                    title: "Ajouter arrêt",
                    onPressed: () {
                      final newTextFieldName = 'Stop${_newTextFieldId++}';
                      final newTextFieldKey = ValueKey(_newTextFieldId);
                      setState(() {
                        fields.add(CustomTextFieldLatLong(
                          key: newTextFieldKey,
                          index: _newTextFieldId,
                          name: newTextFieldName,
                          onDelete: () {
                            setState(() {
                              fields
                                  .removeWhere((e) => e.key == newTextFieldKey);
                            });
                          },
                        ));
                      });
                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
