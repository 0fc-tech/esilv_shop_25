import 'package:esilv_shop/model/cart.dart';
import 'package:esilv_shop/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListProduct extends StatelessWidget {
  final List<Product> listProducts;
  final bool isAddingMode;
  const ListProduct({
    super.key,
    required this.listProducts,
    this.isAddingMode = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listProducts.length,
      itemBuilder: (context, index) =>
          ListTileProduct(listProducts[index], isAddingMode: isAddingMode),
    );
  }
}

class ListTileProduct extends ConsumerStatefulWidget {
  final Product product;
  final bool isAddingMode;

  const ListTileProduct(this.product, {super.key, this.isAddingMode = true});

  @override
  ConsumerState<ListTileProduct> createState() => _ListTileProductState();
}

class _ListTileProductState extends ConsumerState<ListTileProduct> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.go("/detail/${widget.product.id}"),
      title: Text(widget.product.name, maxLines: 2),
      subtitle: Text(
        widget.product.getPriceInEuros(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: TextButton(
        onPressed: () {
          if (widget.isAddingMode) {
            ref.read(cartProvider.notifier).add(widget.product);
          } else {
            ref.read(cartProvider.notifier).remove(widget.product);
          }
        },
        child: Text(widget.isAddingMode ? "AJOUTER" : "RETIRER"),
      ),
      leading: Image.network(widget.product.image, width: 60),
    );
  }
}
