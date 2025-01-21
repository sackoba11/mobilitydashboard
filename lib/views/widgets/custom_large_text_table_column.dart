import 'package:flutter/material.dart';
import 'package:paged_datatable/paged_datatable.dart';

import '../../models/bus/bus_from_firestore/bus.dart';

LargeTextTableColumn<String, Bus> customLargeTextTableColumn(
    {required String id,
    required String title,
    required String? Function(Bus, int) getter,
    required Future<bool> Function(Bus, String, int) setter}) {
  return LargeTextTableColumn(
      title: Text(title),
      showTooltip: false,
      getter: getter,
      id: id,
      size: const RemainingColumnSize(),
      fieldLabel: id,
      setter: setter);
}
