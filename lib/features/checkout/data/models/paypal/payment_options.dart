class PaymentOptions {
  String allowedPaymentMethod;

  PaymentOptions({required this.allowedPaymentMethod});

  Map<String, dynamic> toMap() {
    return {
      "allowed_payment_method": allowedPaymentMethod,
    };
  }
}