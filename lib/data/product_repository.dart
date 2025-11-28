import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/product.dart';

part 'product_repository.g.dart';

@riverpod
ProductRepository getProductRepository(Ref ref) => ProductRepository();

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

  Future<Product> getProductById(int id) async {
    final response = await get(
      Uri.parse("https://fakestoreapi.com/products/$id"),
    );
    if (response.statusCode == 200) {
      final responseBody = response.body;
      final Map<String, dynamic> productJson = jsonDecode(responseBody);
      return Product.fromJson(productJson);
    } else {
      return Future.error("Erreur de connexion");
    }
  }
}
