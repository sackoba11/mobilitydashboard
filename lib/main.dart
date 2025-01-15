import 'package:flutter/material.dart';
import 'package:mobilitydashboard/root.dart';

import 'di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const Root());
}
