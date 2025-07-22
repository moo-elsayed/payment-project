abstract class StripeStates {}

class StripeInitial extends StripeStates {}

class StripeLoading extends StripeStates {}

class StripeSuccess extends StripeStates {}

class StripeFailure extends StripeStates {
  final String errorMessage;

  StripeFailure({required this.errorMessage});
}
