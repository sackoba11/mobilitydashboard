import 'package:flutter/material.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.transparent,
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
