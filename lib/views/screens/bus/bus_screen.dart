import 'package:flutter/material.dart';
import 'package:mobilitydashboard/core/theme/color/i_app_color.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IAppColor.transparent,
      body: Center(
        child: Text('BusScreen'),
      ),
    );
  }
}
