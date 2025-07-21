import '../features/checkout/data/models/paypal/amount.dart';
import '../features/checkout/data/models/paypal/details.dart';
import '../features/checkout/data/models/paypal/item.dart';
import '../features/checkout/data/models/paypal/item_list.dart';
import '../features/checkout/data/models/paypal/payment_options.dart';
import '../features/checkout/data/models/paypal/paypal_transaction.dart';
import '../features/checkout/data/models/paypal/shipping_address.dart';

PaypalTransaction getTransactionsData() {
  PaypalTransaction paypalTransaction = PaypalTransaction(
    amount: Amount(
      totalAmount: "100",
      currency: 'USD',
      details: Details(subtotal: '100', shipping: "0", shippingDiscount: 0),
    ),
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
        city: 'toukh',
        countryCode: 'EG',
        postalCode: '13741',
        phone: '+201149629327',
        state: 'Qalyubia',
      ),
    ),
  );

  return paypalTransaction;
}
