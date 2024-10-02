class PaymentIntentInput {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInput(
      {required this.customerId, required this.currency, required this.amount});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
