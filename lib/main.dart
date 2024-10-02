import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/features/checkout/presentation/views/my_cart_view/my_cart_view.dart';
import 'package:payment_project/simple_bloc_observer.dart';

void main() {
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  Bloc.observer = SimpleBlocObserver();
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyCartView());
  }
}
