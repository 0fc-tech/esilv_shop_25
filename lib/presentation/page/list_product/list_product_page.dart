import 'package:esilv_shop/data/product_repository.dart';
import 'package:esilv_shop/model/cart.dart';
import 'package:esilv_shop/presentation/common/list_product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListProductPage extends StatelessWidget {
  const ListProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.grid_view_rounded)),
          IconButton(
            onPressed: () {
              context.go("/cart");
            },
            icon: Badge(
              label: Text(context.watch<Cart>().length().toString()),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
        future: ProductRepository().getProducts(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData && asyncSnapshot.data != null) {
            return ListProduct(listProducts: asyncSnapshot.data!);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
