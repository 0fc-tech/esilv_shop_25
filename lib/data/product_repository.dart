import 'dart:convert';

import 'package:http/http.dart';

import '../model/product.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    final response = await get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      final responseBody = response.body;
      final List<dynamic> productsJson = jsonDecode(responseBody);
      return productsJson
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return Future.error("Erreur de connexion");
    }
  }
}
