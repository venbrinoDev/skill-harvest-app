class Product {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Product({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  Product copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      Product(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
