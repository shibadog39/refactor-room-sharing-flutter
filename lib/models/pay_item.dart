class PayItem {
  final String date;
  final String name;
  final double price;
  final int userId;

  PayItem({
    this.date,
    this.name,
    this.price,
    this.userId,
  });

  factory PayItem.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return PayItem(
      date: json['date'] as String,
      name: json['name'] as String,
      price: json['price'] as double,
      userId: json['userId'] as int,
    );
  }
}
