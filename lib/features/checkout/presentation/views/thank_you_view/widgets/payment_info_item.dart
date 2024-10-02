import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Styles.styleRegular18(),
        ),
        Text(
          text2,
          style: Styles.styleSemiBold18(),
        ),
      ],
    );
  }
}
