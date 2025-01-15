import 'package:flutter/material.dart';

import '../../../core/theme/color/i_app_color.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IAppColor.transparent,
      body: Center(
        child: Text('DriverScreen'),
      ),
    );
  }
}