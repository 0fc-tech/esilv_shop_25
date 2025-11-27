class Product {
  int id;
  String name;
  String description;
  int price;
  String category;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });

  String getPriceInEuros() {
    return "${(price / 100).toStringAsFixed(2)}€";
  }

  static int priceNumToInt(num priceWithCent) {
    return (priceWithCent * 100).toInt();
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['title'] as String,
      description: map['description'] as String,
      price: priceNumToInt(map['price']),
      category: map['category'] as String,
      image: map['image'] as String,
    );
  }
}
