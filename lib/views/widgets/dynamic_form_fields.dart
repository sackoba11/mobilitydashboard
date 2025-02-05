import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

import '../../models/stop/stop.dart';
import 'custom_button.dart';
import 'custom_text_field_lat_long.dart';

class DynamicFormFields extends StatefulWidget {
  final List<Widget> columns;
  final bool isBus;
  final bool isStation;
  final Function() onTap;
  List? roadMapTextEditingController;
  Stop? locationStation;
  DynamicFormFields({
    super.key,
    required this.columns,
    this.isBus = false,
    this.isStation = false,
    required this.onTap,
    this.roadMapTextEditingController,
    this.locationStation,
  });

  @override
  State<DynamicFormFields> createState() => _DynamicFormFieldsState();
}

class _DynamicFormFieldsState extends State<DynamicFormFields> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<Widget> fields = [];
  final List<String> latList = [];
  final List<String> longList = [];
  final List<String> stop = [];

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
                    onPressed: () async {
                      _formKey.currentState!.saveAndValidate();
                      setState(() {
                        savedValue =
                            _formKey.currentState?.value.toString() ?? '';
                      });
                      if (_formKey.currentState!.isValid) {
                        if (widget.isBus) {
                          Map<String, dynamic> result = {};
                          List<String> str = savedValue
                              .replaceAll("{", "")
                              .replaceAll("}", "")
                              .split(",");
                          for (int i = 3; i < str.length; i++) {
                            List<String> s = str[i].split(":");
                            s[0] = '"${s[0].trim()}"';
                            s[1] = s[1].trim();
                            if (i % 2 != 0) {
                              latList.add(s[1]);
                            } else {
                              longList.add(s[1]);
                            }
                            result.putIfAbsent(s[0].trim(), () => s[1].trim());
                          }

                          for (int i = 0; i < latList.length; i++) {
                            widget.roadMapTextEditingController!.add(
                              Stop(
                                      lat: double.parse(latList[i]),
                                      long: double.parse(longList[i]))
                                  .toJson()
                                  .entries,
                            );
                          }
                        } else if (widget.isStation) {
                          List<String> str = savedValue
                              .replaceAll("{", "")
                              .replaceAll("}", "")
                              .split(",");
                          print(str);
                          for (int i = 3; i < str.length; i++) {
                            List<String> s = str[i].split(":");
                            s[0] = '"${s[0].trim()}"';
                            s[1] = s[1].trim();
                            stop.add(s[1]);
                          }
                          print(stop);

                          setState(() {
                            widget.locationStation = Stop(
                                lat: double.parse(stop[0]),
                                long: double.parse(stop[1]));
                            print(widget.locationStation);
                          });
                        }

                        widget.onTap();
                        Navigator.of(context).pop();
                        _formKey.currentState!.reset();
                      }
                    },
                  )),
                  context.gaps.normal,
                  widget.isBus
                      ? Expanded(
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
                                    fields.removeWhere(
                                        (e) => e.key == newTextFieldKey);
                                  });
                                },
                              ));
                            });
                          },
                        ))
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
