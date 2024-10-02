import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_project/core/get_transactions.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/features/checkout/data/cubits/payment_cubit/payment_cubit.dart';
import 'package:payment_project/features/checkout/data/cubits/payment_cubit/payment_states.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/thank_you_view.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../data/models/stripe/payment_intent/payment_intent_input.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (BuildContext context, Object? state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ThankYouView(),
          ));
        } else if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading,
          label: 'Continue',
          on: () {
            if (BlocProvider.of<PaymentCubit>(context).paymentIndex == 0) {
              executeStripePayment(context: context);
            } else {
              executePaypalPayment(context: context);
            }
          },
        );
      },
    );
  }
}

//----------------------------------------------------

void executeStripePayment({required BuildContext context}) {
  BlocProvider.of<PaymentCubit>(context).makePayment(
      paymentIntentInput: PaymentIntentInput(
          currency: 'usd', amount: '200', customerId: 'cus_Qx9NI2eojWRXfj'));
}

void executePaypalPayment({required BuildContext context}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.paypalClientId,
      secretKey: ApiKeys.paypalSecretKey,
      transactions: [getTransactionsData().toMap()],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        Navigator.pop(context);
      },
      onError: (error) {
        log("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:');
        Navigator.pop(context);
      },
    ),
  ));
}
