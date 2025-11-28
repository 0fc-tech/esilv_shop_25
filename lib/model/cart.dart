import 'package:flutter/material.dart';

import 'product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _cartList = [];

  List<Product> get products => _cartList;

  void add(Product product) {
    _cartList.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _cartList.remove(product);
    notifyListeners();
  }

  int length() => _cartList.length;
}
