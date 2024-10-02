import 'package:flutter/material.dart';

class WhiteCircle extends StatelessWidget {
  const WhiteCircle({super.key, this.radius});

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
    );
  }
}
