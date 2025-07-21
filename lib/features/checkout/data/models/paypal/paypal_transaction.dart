import 'package:payment_project/features/checkout/data/models/paypal/payment_options.dart';
import 'amount.dart';
import 'item_list.dart';

class PaypalTransaction {
  Amount amount;
  String description;
  PaymentOptions paymentOptions;
  ItemList itemList;

  PaypalTransaction({
    required this.amount,
    required this.description,
    required this.paymentOptions,
    required this.itemList,
  });

  Map<String, dynamic> toMap() {
    return {
      "amount": amount.toMap(),
      "description": description,
      "payment_options": paymentOptions.toMap(),
      "item_list": itemList.toMap(),
    };
  }
}
