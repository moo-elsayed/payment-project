import 'package:flutter/material.dart';
import 'package:payment_project/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      required this.on,
      this.isLoading = false});

  final String label;
  final void Function() on;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: on,
      minWidth: double.infinity,
      color: const Color(0xff34A853),
      height: 60,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff34A853))),
      child: isLoading
          ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: Colors.white,
              ))
          : Text(label, style: Styles.styleMedium22()),
    );
  }
}
