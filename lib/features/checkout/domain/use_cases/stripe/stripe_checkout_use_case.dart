import 'package:dartz/dartz.dart';
import 'package:payment_project/features/checkout/domain/repos/stripe/stripe_checkout_repo.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../../../data/models/stripe/payment_intent/payment_intent_input.dart';

class StripeCheckoutUseCase extends UseCase<void, PaymentIntentInput> {
  final StripeCheckOutRepo stripeCheckOutRepo;

  StripeCheckoutUseCase({required this.stripeCheckOutRepo});

  @override
  Future<Either<Failure, void>> call(
      [PaymentIntentInput? paymentIntentInput]) async {
    return await stripeCheckOutRepo.makePayment(
      paymentIntentInput: paymentIntentInput!,
    );
  }
}
