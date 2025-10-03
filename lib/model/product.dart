class Product {
  String name;
  String description;
  int price;
  String category;
  String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });

  String getPriceInEuros() {
    return "${(price / 100).toStringAsFixed(2)}€";
  }
}
