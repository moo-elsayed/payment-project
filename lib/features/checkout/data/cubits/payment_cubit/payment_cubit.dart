import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_project/features/checkout/data/cubits/payment_cubit/payment_states.dart';
import 'package:payment_project/features/checkout/data/repos/checkout_repo.dart';

import '../../models/stripe/payment_intent/payment_intent_input.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;
  int paymentIndex = 0;

  Future makePayment({required PaymentIntentInput paymentIntentInput}) async {
    emit(PaymentLoading());
    var result =
        await checkOutRepo.makePayment(paymentIntentInput: paymentIntentInput);
    result.fold(
        (failure) => emit(PaymentFailure(errorMessage: failure.errorMessage)),
        (r) => emit(PaymentSuccess()));
  }

  void updateIndex(int index) {
    paymentIndex = index;
    emit(PaymentIndexChange());
  }
}
