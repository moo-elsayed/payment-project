import '../../../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/stripe/payment_intent/payment_intent_input.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInput paymentIntentInput});
}
