import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/widgets/payment_item_list_view.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  int paymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentItemListView(
            onChanged: (value) {
              paymentIndex = value;
              setState(() {});
            },
          ),
          CustomButtonBlocConsumer(paymentIndex: paymentIndex),
        ],
      ),
    );
  }
}
