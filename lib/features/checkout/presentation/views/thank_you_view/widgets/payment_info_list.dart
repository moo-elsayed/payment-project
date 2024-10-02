import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/widgets/payment_info_item.dart';

class PaymentInfoList extends StatelessWidget {
  const PaymentInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          paymentList.length,
          (index) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: PaymentInfoItem(
                    text1: paymentList[index]['text1'],
                    text2: paymentList[index]['text2']),
              )),
    );
  }
}

List paymentList = [
  {
    'text1': 'Date',
    'text2': '01/24/2023',
  },
  {
    'text1': 'Time',
    'text2': '10:15 AM',
  },
  {
    'text1': 'To',
    'text2': 'Sam Louis',
  }
];
