import '../../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../data/models/stripe/payment_intent/payment_intent_input.dart';

abstract class StripeCheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInput paymentIntentInput});
}
