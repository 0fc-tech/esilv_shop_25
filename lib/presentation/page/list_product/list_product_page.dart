import 'package:esilv_shop/data/product_repository.dart';
import 'package:flutter/material.dart';

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
            icon: Badge(label: Text("0"), child: Icon(Icons.shopping_cart)),
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
              itemBuilder: (context, index) => ListTile(
                title: Text(asyncSnapshot.data![index].name, maxLines: 2),
                subtitle: Text(
                  asyncSnapshot.data![index].getPriceInEuros(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: TextButton(onPressed: () {}, child: Text("AJOUTER")),
                leading: Image.network(
                  asyncSnapshot.data![index].image,
                  width: 60,
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
