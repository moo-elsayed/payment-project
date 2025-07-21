import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_project/core/errors/failures.dart';
import 'package:payment_project/core/utils/stripe_service.dart';
import '../models/stripe/payment_intent/payment_intent_input.dart';
import 'checkout_repo.dart';

class CheckOutRepoImp extends CheckOutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInput paymentIntentInput}) async {
    try {
      await stripeService.makePayment(paymentIntentInput: paymentIntentInput);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(
          ServerFailure(errorMessage: 'the payment has been canceled'),
        );
      }
    }
  }
}
