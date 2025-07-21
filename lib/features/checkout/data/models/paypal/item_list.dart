import 'package:payment_project/features/checkout/data/models/paypal/shipping_address.dart';

import 'item.dart';

class ItemList {
  List<Item> items;
  ShippingAddress? shippingAddress;

  ItemList({required this.items, this.shippingAddress});

  Map<String, dynamic> toMap() {
    return {
      "items": items.map((item) => item.toMap()).toList(),
      if (shippingAddress != null) "shipping_address": shippingAddress!.toMap(),
    };
  }
}