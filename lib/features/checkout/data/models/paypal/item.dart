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