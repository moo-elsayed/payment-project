import 'package:payment_project/core/utils/mohamed.dart';

import '../features/checkout/data/models/paypal/paypal_transaction.dart';




PaypalTransaction getTransactionsData() {
  PaypalTransaction paypalTransaction = PaypalTransaction(
      amount: Amount(
          totalAmount: "100",
          currency: 'USD',
          details:
              Details(subtotal: '100', shipping: "0", shippingDiscount: 0)),
      description: "The payment transaction description.",
      paymentOptions:
          PaymentOptions(allowedPaymentMethod: "INSTANT_FUNDING_SOURCE"),
      itemList: ItemList(
          items: [
            Item(name: 'Apple', quantity: 4, price: '10', currency: 'USD'),
            Item(name: 'Pineapple', quantity: 5, price: '12', currency: "USD")
          ],
          shippingAddress: ShippingAddress(
              recipientName: 'Mohamed',
              line1: 'Mohamed',
              line2: '',
              city: Mohamed.city,
              countryCode: 'EG',
              postalCode: Mohamed.postalCode,
              phone: Mohamed.phone,
              state: Mohamed.state)));

  return paypalTransaction;
}

// PaypalTransaction paypalTransaction = PaypalTransaction.fromJson({
//   "amount": {
//     "total": "100",
//     "currency": "USD",
//     "details": {"subtotal": "100", "shipping": "0", "shipping_discount": 0}
//   },
//   "description": "The payment transaction description.",
//   "item_list": {
//     "items": [
//       {"name": "Apple", "quantity": 4, "price": "10", "currency": "USD"},
//       {"name": "Pineapple", "quantity": 5, "price": "12", "currency": "USD"}
//     ],
//     "shipping_address": {
//       "recipient_name": "Mohamed",
//       "line1": "Mohamed",
//       "line2": "",
//       "city": Mohamed.city,
//       "country_code": "EG",
//       "postal_code": Mohamed.postalCode,
//       "phone": Mohamed.phone,
//       "state": Mohamed.state
//     },
//   }
// });
