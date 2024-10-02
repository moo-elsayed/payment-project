import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_project/core/utils/api_keys.dart';
import 'package:payment_project/core/utils/api_service.dart';

import '../../features/checkout/data/models/stripe/customer/customer_input_model/customer_input_model.dart';
import '../../features/checkout/data/models/stripe/customer/customer_model/customer_model.dart';
import '../../features/checkout/data/models/stripe/ephemeral_key/ephemeral_key_model.dart';
import '../../features/checkout/data/models/stripe/payment_intent/payment_intent_input.dart';
import '../../features/checkout/data/models/stripe/payment_intent/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInput paymentIntentInput) async {
    var response = await apiService.post(
      body: paymentIntentInput.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
    );
    var paymentIntent = PaymentIntentModel.fromJson(response.data);
    return paymentIntent;
  }

  Future<Customer> createCustomer(CustomerInputModel customerInputModel) async {
    var response = await apiService.post(
      body: customerInputModel.toJson(),
      url: 'https://api.stripe.com/v1/customers',
    );
    var customer = Customer.fromJson(response.data);
    return customer;
  }

  Future initPaymentSheet(
      {required PaymentIntentModel paymentIntent,
      required EphemeralKey ephemeralKey}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      // Customer keys
      customerId: paymentIntent.customer,
      customerEphemeralKeySecret: ephemeralKey.secret,
      // Main params
      merchantDisplayName: 'Mohamed',
      paymentIntentClientSecret: paymentIntent.clientSecret,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInput paymentIntentInput}) async {
    var paymentIntent = await createPaymentIntent(paymentIntentInput);
    var ephemeralKey =
        await createEphemeralKey(customerId: paymentIntent.customer);
    await initPaymentSheet(
        paymentIntent: paymentIntent, ephemeralKey: ephemeralKey);
    await displayPaymentSheet();
  }

  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2024-06-20'
      },
    );
    var ephemeralKey = EphemeralKey.fromJson(response.data);
    return ephemeralKey;
  }
}
