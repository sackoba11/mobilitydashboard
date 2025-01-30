import 'package:flutter/material.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final bool isBorder;
  const CustomButton(
      {super.key, this.onPressed, required this.title, this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: isBorder
                    ? BorderSide(color: context.colors.primary)
                    : BorderSide.none)),
        backgroundColor: WidgetStateProperty.all(context.colors.secondary),
      ),
      onPressed: onPressed,
      child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(title))),
    );
  }
}
