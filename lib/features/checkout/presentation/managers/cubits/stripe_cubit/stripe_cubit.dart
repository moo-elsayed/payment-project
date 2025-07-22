import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_project/features/checkout/domain/use_cases/stripe/stripe_checkout_use_case.dart';
import 'package:payment_project/features/checkout/presentation/managers/cubits/stripe_cubit/stripe_states.dart';
import '../../../../data/models/stripe/payment_intent/payment_intent_input.dart';

class StripeCubit extends Cubit<StripeStates> {
  StripeCubit(this.stripeCheckoutUseCase) : super(StripeInitial());
  final StripeCheckoutUseCase stripeCheckoutUseCase;

  Future makePayment({required PaymentIntentInput paymentIntentInput}) async {
    emit(StripeLoading());
    var result = await stripeCheckoutUseCase.call(paymentIntentInput);
    result.fold(
      (failure) => emit(
        StripeFailure(errorMessage: failure.errorMessage),
      ),
      (r) => emit(
        StripeSuccess(),
      ),
    );
  }
}
