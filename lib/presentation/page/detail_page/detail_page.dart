import 'package:esilv_shop/data/product_repository.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  int productId;
  DetailPage(this.productId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('appbarTitle'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: ProductRepository().getProductById(productId),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData && asyncSnapshot.data != null) {
              final product = asyncSnapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.network(product.image, height: 240)),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${product.name}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Text(product.getPriceInEuros()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.description),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("Ajouter"),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
