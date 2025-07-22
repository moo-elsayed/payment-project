import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_project/core/errors/failures.dart';
import '../../data_sources/stripe/stripe_checkout_remote_data_source.dart';
import '../../models/stripe/payment_intent/payment_intent_input.dart';
import '../../../domain/repos/stripe/stripe_checkout_repo.dart';

class StripeCheckOutRepoImp extends StripeCheckOutRepo {
  final StripeCheckoutRemoteDataSourceImp stripeCheckoutRemoteDataSourceImp;

  StripeCheckOutRepoImp({required this.stripeCheckoutRemoteDataSourceImp});

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInput paymentIntentInput}) async {
    try {
      await stripeCheckoutRemoteDataSourceImp.makePayment(
          paymentIntentInput: paymentIntentInput);
      return right(null);
    } catch (e) {
      return handelError(e);
    }
  }

  Either<Failure, void> handelError(Object e) {
    if (e is StripeException) {
      return left(
        ServerFailure(
            errorMessage: e.error.message ?? 'the payment has been canceled'),
      );
    } else if (e is DioException) {
      return left(ServerFailure.fromDioException(e));
    } else {
      return left(
        ServerFailure(errorMessage: 'the payment has been canceled'),
      );
    }
  }
}
