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
