import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';


class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.text, required this.price});

  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.styleRegular18(),
        ),
        Text(
          '\$$price',
          style: Styles.styleRegular18(),
        ),
      ],
    );
  }
}
