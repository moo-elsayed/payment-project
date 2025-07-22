import 'package:flutter_stripe/flutter_stripe.dart';
import '../../../../../core/utils/api_keys.dart';
import '../../../../../core/utils/api_service.dart';
import '../../models/stripe/customer/customer_input_model/customer_input_model.dart';
import '../../models/stripe/customer/customer_model/customer_model.dart';
import '../../models/stripe/ephemeral_key/ephemeral_key_model.dart';
import '../../models/stripe/payment_intent/payment_intent_input.dart';
import '../../models/stripe/payment_intent/payment_intent_model/payment_intent_model.dart';

abstract class StripeCheckoutRemoteDataSource {
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInput paymentIntentInput);

  Future<Customer> createCustomer(CustomerInputModel customerInputModel);

  Future initPaymentSheet(
      {required PaymentIntentModel paymentIntent,
      required EphemeralKey ephemeralKey});

  Future displayPaymentSheet();

  Future makePayment({required PaymentIntentInput paymentIntentInput});

  Future<EphemeralKey> createEphemeralKey({required String customerId});
}

class StripeCheckoutRemoteDataSourceImp
    implements StripeCheckoutRemoteDataSource {
  final ApiService apiService;

  StripeCheckoutRemoteDataSourceImp({required this.apiService});

  @override
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInput paymentIntentInput) async {
    var response = await apiService.post(
      body: paymentIntentInput.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
    );
    var paymentIntent = PaymentIntentModel.fromJson(response.data);
    return paymentIntent;
  }

  @override
  Future<Customer> createCustomer(CustomerInputModel customerInputModel) async {
    var response = await apiService.post(
      body: customerInputModel.toJson(),
      url: 'https://api.stripe.com/v1/customers',
    );
    var customer = Customer.fromJson(response.data);
    return customer;
  }

  @override
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

  @override
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  @override
  Future makePayment({required PaymentIntentInput paymentIntentInput}) async {
    var paymentIntent = await createPaymentIntent(paymentIntentInput);
    var ephemeralKey =
        await createEphemeralKey(customerId: paymentIntent.customer);
    await initPaymentSheet(
        paymentIntent: paymentIntent, ephemeralKey: ephemeralKey);
    await displayPaymentSheet();
  }

  @override
  Future<EphemeralKey> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      headers: {
        'Authorization': 'Bearer $stripeSecretKey',
        'Stripe-Version': '2024-06-20'
      },
    );
    var ephemeralKey = EphemeralKey.fromJson(response.data);
    return ephemeralKey;
  }
}
