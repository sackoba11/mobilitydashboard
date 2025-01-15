import 'package:flutter/material.dart';
import 'package:mobilitydashboard/core/theme/color/i_app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IAppColor.transparent,
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
