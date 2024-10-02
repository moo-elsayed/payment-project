import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_project/features/checkout/data/cubits/payment_cubit/payment_cubit.dart';
import 'package:payment_project/features/checkout/data/cubits/payment_cubit/payment_states.dart';
import 'package:payment_project/features/checkout/presentation/views/payment_details/widgets/payment_item.dart';

class PaymentItemListView extends StatelessWidget {
  const PaymentItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (BlocProvider.of<PaymentCubit>(context).paymentIndex != 0) {
                BlocProvider.of<PaymentCubit>(context).updateIndex(0);
              }
            },
            child: PaymentItem(
                isActive:
                    BlocProvider.of<PaymentCubit>(context).paymentIndex == 0,
                assetName: assetNames[0],
                count: assetNames.length + 1),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              if (BlocProvider.of<PaymentCubit>(context).paymentIndex != 1) {
                BlocProvider.of<PaymentCubit>(context).updateIndex(1);
              }
            },
            child: PaymentItem(
              isActive:
                  BlocProvider.of<PaymentCubit>(context).paymentIndex == 1,
              assetName: assetNames[1],
              count: assetNames.length + 1,
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
  //'assets/images/apple_pay.svg',
];

// return SizedBox(
//   height: 63,
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: assetNames.length,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: assetNames.length == 2
//             ? EdgeInsets.only(left: index == 1 ? 20 : 0)
//             : EdgeInsets.symmetric(horizontal: index == 1 ? 20 : 0),
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           child: PaymentItem(
//               isActive: selectedIndex == index,
//               assetName: assetNames[index],
//               count: assetNames.length+1),
//         ),
//       );
//     },
//   ),
// );
