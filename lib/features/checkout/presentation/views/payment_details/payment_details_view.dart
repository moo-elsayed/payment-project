import 'package:flutter/material.dart';
import 'package:payment_project/core/widgets/custom_app_bar.dart';
import 'package:payment_project/features/checkout/presentation/views/payment_details/widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        text: 'Payment Details',
        onTap: () => Navigator.pop(context),
      ),
      body: const PaymentDetailsBody(),
    );
  }
}
