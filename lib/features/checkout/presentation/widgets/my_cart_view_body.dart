import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_project/core/widgets/custom_button.dart';
import 'package:payment_project/core/widgets/total_price.dart';
import 'package:payment_project/features/checkout/data/repos/checkout_repo_imp.dart';
import 'package:payment_project/features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';

import '../managers/cubits/payment_cubit/payment_cubit.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/product.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            text: 'Order Subtotal',
            price: 42.97,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: OrderInfoItem(
              text: 'Discount',
              price: 0,
            ),
          ),
          const OrderInfoItem(
            text: 'Shipping',
            price: 8,
          ),
          const Divider(
            height: 34,
            color: Color(0xffC7C7C7),
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          const TotalPrice(price: 50.97),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            label: 'Complete Payment',
            on: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const PaymentDetailsView(),
              // ));
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckOutRepoImp()),
                    child: const PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
