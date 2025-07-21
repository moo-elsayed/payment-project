import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CustomDottedLine extends StatelessWidget {
  const CustomDottedLine({super.key, required this.lineLength});

  final double lineLength;

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      dashColor: const Color(0xffB8B8B8),
      direction: Axis.horizontal,
      lineThickness: 2,
      lineLength: lineLength,
    );
  }
}
