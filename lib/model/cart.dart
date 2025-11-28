import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'product.dart';

part 'cart.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<Product> build() {
    return [];
  }

  void add(Product product) {
    state = [...state, product];
  }

  void remove(Product product) {
    state = state.where((element) => element != product).toList();
  }
}

/*
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
}*/
