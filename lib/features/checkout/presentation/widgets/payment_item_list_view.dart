import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/widgets/payment_item.dart';

class PaymentItemListView extends StatefulWidget {
  const PaymentItemListView({super.key, required this.onChanged});

  final Function(int) onChanged;

  @override
  State<PaymentItemListView> createState() => _PaymentItemListViewState();
}

class _PaymentItemListViewState extends State<PaymentItemListView> {
  int paymentIndex = 0;

  List<String> paymentMethodsPics = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (paymentIndex != 0) {
                paymentIndex = 0;
                widget.onChanged(paymentIndex);
                setState(() {});
              }
            },
            child: PaymentItem(
              isActive: paymentIndex == 0,
              assetName: paymentMethodsPics[0],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (paymentIndex != 1) {
                paymentIndex = 1;
                widget.onChanged(paymentIndex);
                setState(() {});
              }
            },
            child: PaymentItem(
              isActive: paymentIndex == 1,
              assetName: paymentMethodsPics[1],
            ),
          ),
        ),
      ],
    );
  }
}
