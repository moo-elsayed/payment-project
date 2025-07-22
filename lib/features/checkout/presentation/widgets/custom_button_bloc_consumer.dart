import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_project/core/get_transactions.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/core/widgets/custom_toast.dart';
import 'package:payment_project/features/checkout/presentation/managers/cubits/stripe_cubit/stripe_states.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/stripe/payment_intent/payment_intent_input.dart';
import '../managers/cubits/stripe_cubit/stripe_cubit.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.paymentIndex});

  final int paymentIndex;

  @override
  Widget build(BuildContext context) {
    return paymentIndex == 0
        ? BlocConsumer<StripeCubit, StripeStates>(
            listener: (BuildContext context, Object? state) {
              if (state is StripeSuccess) {
                onSuccess(context);
              } else if (state is StripeFailure) {
                onFailure(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is StripeLoading,
                label: 'Continue',
                on: () {
                  executeStripePayment(context);
                },
              );
            },
          )
        : CustomButton(
            isLoading: false,
            label: 'Continue',
            on: () {
              executePaypalPayment(context);
            },
          );
  }

  void onFailure(BuildContext context, String errorMessage,
      [bool fromPaypal = false]) {
    if (fromPaypal) Navigator.pop(context);
    Navigator.pop(context);

    showCustomToast(
      context: context,
      message: errorMessage,
      contentType: ContentType.failure,
    );
  }

  void onSuccess(BuildContext context, [bool fromPaypal = false]) {
    fromPaypal
        ? Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
            // delete all views besides the first view (the root)
            (route) => route.settings.name == '/',
          )
        : Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
  }

  void executePaypalPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: paypalClientId,
          secretKey: paypalSecretKey,
          transactions: [getTransactionsData().toMap()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            onSuccess(context, true);
          },
          onError: (error) {
            onFailure(context, error.toString(),true);
          },
          onCancel: () {
            onFailure(context, 'Payment cancelled');
          },
        ),
      ),
    );
  }

  void executeStripePayment(BuildContext context) {
    context.read<StripeCubit>().makePayment(
          paymentIntentInput: PaymentIntentInput(
            currency: 'usd',
            amount: '200',
            customerId: 'cus_Qx9NI2eojWRXfj',
          ),
        );
  }
}
