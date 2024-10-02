import 'package:flutter/material.dart';

import '../utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: Styles.styleSemiBold24(),
        ),
        Text(
          '\$$price',
          style: Styles.styleSemiBold24(),
        ),
      ],
    );
  }
}
