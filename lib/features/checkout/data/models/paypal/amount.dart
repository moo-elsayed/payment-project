import 'details.dart';

class Amount {
  String totalAmount;
  String currency;
  Details details;

  Amount({required this.totalAmount, required this.currency, required this.details});

  Map<String, dynamic> toMap() {
    return {
      "total": totalAmount,
      "currency": currency,
      "details": details.toMap(),
    };
  }
}
