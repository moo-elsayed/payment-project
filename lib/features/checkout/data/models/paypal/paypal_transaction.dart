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

class Details {
  String subtotal;
  String shipping;
  int shippingDiscount;

  Details({required this.subtotal, required this.shipping, required this.shippingDiscount});

  Map<String, dynamic> toMap() {
    return {
      "subtotal": subtotal,
      "shipping": shipping,
      "shipping_discount": shippingDiscount,
    };
  }
}

class PaymentOptions {
  String allowedPaymentMethod;

  PaymentOptions({required this.allowedPaymentMethod});

  Map<String, dynamic> toMap() {
    return {
      "allowed_payment_method": allowedPaymentMethod,
    };
  }
}

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

class Item {
  String name;
  int quantity;
  String price;
  String currency;

  Item({required this.name, required this.quantity, required this.price, required this.currency});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "quantity": quantity,
      "price": price,
      "currency": currency,
    };
  }
}

class ShippingAddress {
  String recipientName;
  String line1;
  String? line2;
  String city;
  String countryCode;
  String postalCode;
  String phone;
  String state;

  ShippingAddress({
    required this.recipientName,
    required this.line1,
    this.line2,
    required this.city,
    required this.countryCode,
    required this.postalCode,
    required this.phone,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      "recipient_name": recipientName,
      "line1": line1,
      if (line2 != null) "line2": line2,
      "city": city,
      "country_code": countryCode,
      "postal_code": postalCode,
      "phone": phone,
      "state": state,
    };
  }
}
