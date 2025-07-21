import 'package:flutter/material.dart';
import 'package:payment_project/features/checkout/presentation/widgets/payment_item_list_view.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentItemListView(),
          SizedBox(
            height: 20,
          ),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
