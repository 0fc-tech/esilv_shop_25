//stless
import 'package:esilv_shop/model/cart.dart';
import 'package:esilv_shop/presentation/common/list_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Panier Esilv Shop'),
      ),
      body: (cart.length == 0)
          ? EmptyCart()
          : ListProduct(isAddingMode: false, listProducts: cart), //ListCart();
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              Text("Votre panier total est de"),
              Spacer(),
              Text("0.00€", style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Votre panier est actuellement vide"),
                Icon(Icons.image),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//fscaff ou scfAppBar
