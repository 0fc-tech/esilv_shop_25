import 'package:esilv_shop/data/product_repository.dart';
import 'package:esilv_shop/model/cart.dart';
import 'package:esilv_shop/model/product.dart';
import 'package:flutter/material.dart';
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
            onPressed: () {},
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
            return ListView.builder(
              itemCount: asyncSnapshot.data!.length,
              itemBuilder: (context, index) =>
                  ListTileProduct(asyncSnapshot.data![index]),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ListTileProduct extends StatefulWidget {
  final Product product;
  const ListTileProduct(this.product, {super.key});

  @override
  State<ListTileProduct> createState() => _ListTileProductState();
}

class _ListTileProductState extends State<ListTileProduct> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name, maxLines: 2),
      subtitle: Text(
        widget.product.getPriceInEuros() + quantity.toString(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: TextButton(
        onPressed: () {
          context.read<Cart>().add(widget.product);
          setState(() {
            quantity++;
          });
        },
        child: Text("AJOUTER"),
      ),
      leading: Image.network(widget.product.image, width: 60),
    );
  }
}
