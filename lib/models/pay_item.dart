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
        // TODO: Implement this
        );
  }
}
