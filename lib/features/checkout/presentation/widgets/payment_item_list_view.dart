import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_project/features/checkout/presentation/widgets/payment_item.dart';
import '../managers/cubits/payment_cubit/payment_cubit.dart';
import '../managers/cubits/payment_cubit/payment_states.dart';

class PaymentItemListView extends StatelessWidget {
  const PaymentItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentCubit cubit = context.read<PaymentCubit>();
    return BlocBuilder<PaymentCubit, PaymentStates>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (cubit.paymentIndex != 0) {
                  cubit.updateIndex(0);
                }
              },
              child: PaymentItem(
                isActive: cubit.paymentIndex == 0,
                assetName: assetNames[0],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (cubit.paymentIndex != 1) {
                  cubit.updateIndex(1);
                }
              },
              child: PaymentItem(
                isActive: cubit.paymentIndex == 1,
                assetName: assetNames[1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> assetNames = const [
  'assets/images/card.svg',
  'assets/images/paypal.svg',
];
